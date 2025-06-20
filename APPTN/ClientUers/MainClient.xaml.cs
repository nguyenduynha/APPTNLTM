using System;
using System.IO;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media;
using System.Windows.Threading;
using System.Collections.Generic;

namespace ClientApp
{
    public partial class MainClient : Window
    {
        private string playerName;
        private string serverIP;
        private TcpClient client;
        private NetworkStream stream;
        private StreamReader reader;
        private StreamWriter writer; // thêm biến writer
        private DispatcherTimer timer;
        private int timeLeft;
        private string correctAnswer;
        private CancellationTokenSource cts;

        private Queue<string> questionQueue = new Queue<string>();
        private bool isWaitingResult = false;
        private bool isNextPending = false;

        public MainClient(string name, string ip, TcpClient tcpClient)
        {
            InitializeComponent();
            playerName = name;
            serverIP = ip;
            client = tcpClient;
            stream = client.GetStream();

            reader = new StreamReader(stream, System.Text.Encoding.UTF8);
            writer = new StreamWriter(stream, System.Text.Encoding.UTF8) { AutoFlush = true }; // khởi tạo writer

            txtUsername.Text = playerName;
            txtServerIP.Text = serverIP;

            timer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(1) };
            timer.Tick += Timer_Tick;

            txtQuestion.Text = "⏳ Chờ server bắt đầu...";
            cts = new CancellationTokenSource();
            Task.Run(() => WaitForServerCommands(cts.Token));
        }


        private async Task WaitForServerCommands(CancellationToken token)
        {
            try
            {
                while (!token.IsCancellationRequested)
                {
                    string message = await reader.ReadLineAsync();
                    if (message == null) break; // server đóng kết nối

                    Console.WriteLine("Server gửi: " + message);  // (giúp debug)

                    if (message == "START")
                    {
                        Dispatcher.Invoke(() => StartQuizUI());
                    }
                    else if (message.StartsWith("END|Đã hết câu hỏi"))
                    {
                        Dispatcher.Invoke(() =>
                        {
                            txtQuestion.Text = "🏁 Quiz kết thúc!";
                            rdoA.Visibility = rdoB.Visibility = rdoC.Visibility = rdoD.Visibility = Visibility.Collapsed;
                            btnTraLoi.Visibility = Visibility.Collapsed;
                            btnNext.Visibility = Visibility.Collapsed;
                            gridOverlay.Visibility = Visibility.Visible;
                            txtOverlayResult.Text = "📢 Thông báo:";
                            txtOverlayResult.Foreground = Brushes.DarkRed;
                            txtOverlayScore.Text = "Đã hết câu hỏi. Chờ kết quả tổng kết từ server...";
                        });
                    }
                    else if (message.StartsWith("END|"))
                    {
                        string resultData = message.Substring(4);
                        Dispatcher.Invoke(() => EndQuiz(resultData));
                        break; // kết thúc nhận vì quiz đã xong
                    }
                    else if (message.StartsWith("DISCONNECT"))
                    {
                        Dispatcher.Invoke(() =>
                        {
                            MessageBox.Show("Server đã ngắt kết nối.");
                            Application.Current.Shutdown();
                        });
                        break;
                    }
                    else
                    {
                        Dispatcher.Invoke(() =>
                        {
                            if (isWaitingResult)
                                questionQueue.Enqueue(message);
                            else
                                ProcessQuestion(message);
                        });
                    }

                    await Task.Delay(50); // tránh vòng lặp quá nhanh
                }
            }
            catch (Exception ex)
            {
                ShowMessageAndClose("❌ Lỗi khi nhận dữ liệu từ server: " + ex.Message);
            }
        }


        private void ProcessQuestion(string data)
        {
            isNextPending = false;

            string[] parts = data.Split('|');
            if (parts.Length < 7)
            {
                txtQuestion.Text = "⚠ Dữ liệu câu hỏi không hợp lệ.";
                return;
            }

            txtQuestion.Text = parts[0];
            rdoA.Content = "A. " + parts[1];
            rdoB.Content = "B. " + parts[2];
            rdoC.Content = "C. " + parts[3];
            rdoD.Content = "D. " + parts[4];
            correctAnswer = parts[5];

            if (!int.TryParse(parts[6], out timeLeft))
                timeLeft = 10;

            txtTime.Text = $"{timeLeft}s";

            rdoA.IsChecked = rdoB.IsChecked = rdoC.IsChecked = rdoD.IsChecked = false;
            txtResult.Text = "";
            txtResult.Foreground = Brushes.Black;

            rdoA.Visibility = rdoB.Visibility = rdoC.Visibility = rdoD.Visibility = Visibility.Visible;
            btnTraLoi.Visibility = Visibility.Visible;
            btnTraLoi.IsEnabled = true;
            btnNext.Visibility = Visibility.Collapsed;
            gridOverlay.Visibility = Visibility.Collapsed;

            timer.Start();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            timeLeft--;
            txtTime.Text = $"{timeLeft}s";

            if (timeLeft <= 0)
            {
                timer.Stop();
                btnTraLoi.IsEnabled = false;

                txtResult.Text = "⏰ Hết thời gian!";
                txtResult.Foreground = Brushes.OrangeRed;

                SendAnswer("", false);
                ShowResultOverlay("⏰ Hết giờ!", "(0 điểm)", Brushes.OrangeRed);

                isWaitingResult = true;
                btnNext.Visibility = Visibility.Visible;
            }
        }

        private void BtnTraLoi_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(correctAnswer))
            {
                MessageBox.Show("⚠ Chưa có câu hỏi nào để trả lời.");
                return;
            }

            timer.Stop();

            string selected = rdoA.IsChecked == true ? "A" :
                              rdoB.IsChecked == true ? "B" :
                              rdoC.IsChecked == true ? "C" :
                              rdoD.IsChecked == true ? "D" : "";

            if (string.IsNullOrEmpty(selected))
            {
                MessageBox.Show("⚠ Vui lòng chọn một đáp án.");
                timer.Start();
                return;
            }

            bool isCorrect = selected.Equals(correctAnswer, StringComparison.OrdinalIgnoreCase);

            txtResult.Text = isCorrect ? "✅ Chính xác!" : $"❌ Sai! Đáp án đúng là: {correctAnswer}";
            txtResult.Foreground = isCorrect ? Brushes.Green : Brushes.Red;
            btnTraLoi.IsEnabled = false;

            SendAnswer(selected, isCorrect);

            ShowResultOverlay(
                isCorrect ? "🎉 Đúng rồi!" : "😢 Sai mất rồi!",
                isCorrect ? "(+10 điểm)" : "(0 điểm)",
                isCorrect ? Brushes.Green : Brushes.Red
            );

            isWaitingResult = true;
            btnNext.Visibility = Visibility.Visible;
        }

        private void BtnNext_Click(object sender, RoutedEventArgs e)
        {
            if (isNextPending)
            {
                MessageBox.Show("⏳ Đang chờ câu hỏi mới từ server, vui lòng đợi...");
                return;
            }

            btnNext.Visibility = Visibility.Collapsed;
            btnThoat.Visibility = Visibility.Collapsed;    // Ẩn nút Thoát khi còn câu hỏi
            gridOverlay.Visibility = Visibility.Collapsed;
            txtResult.Text = "";
            isWaitingResult = false;

            isNextPending = true;
            SendNextCommand();

            if (questionQueue.Count > 0)
            {
                ProcessQuestion(questionQueue.Dequeue());
                isNextPending = false;
            }
            else
            {
                txtQuestion.Text = "⏳ Đang chờ câu hỏi mới từ server...";
            }
        }


        private void SendAnswer(string answer, bool isCorrect)
        {
            try
            {
                if (client.Connected)
                {
                    string answerLine = $"ANSWER|{playerName}|{answer}|{isCorrect}";
                    byte[] answerData = System.Text.Encoding.UTF8.GetBytes(answerLine + "\n");
                    stream.Write(answerData, 0, answerData.Length);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("❌ Lỗi khi gửi kết quả: " + ex.Message);
            }
        }

        private void ShowResultOverlay(string message, string scoreText, Brush color)
        {
            txtOverlayResult.Text = message;
            txtOverlayResult.Foreground = color;

            txtOverlayScore.Text = scoreText;
            txtOverlayScore.Foreground = color;

            gridOverlay.Visibility = Visibility.Visible;
        }

        private void EndQuiz(string resultData)
        {
            timer.Stop();
            txtQuestion.Text = "🏁 Quiz kết thúc!";
            rdoA.Visibility = rdoB.Visibility = rdoC.Visibility = rdoD.Visibility = Visibility.Collapsed;
            btnTraLoi.Visibility = Visibility.Collapsed;
            btnTraLoi.IsEnabled = false;
            btnNext.Visibility = Visibility.Collapsed;   // Ẩn nút tiếp theo khi hết câu hỏi
            btnThoat.Visibility = Visibility.Visible;    // Hiện nút Thoát
            gridOverlay.Visibility = Visibility.Visible;

            txtOverlayResult.Text = "📊 Kết quả chung:";
            txtOverlayResult.Foreground = Brushes.DarkBlue;

            if (!string.IsNullOrEmpty(resultData))
            {
                List<(string player, int score)> playerScores = new List<(string, int)>();

                string[] players = resultData.Split(',');
                foreach (string p in players)
                {
                    string[] parts = p.Split(':');
                    if (parts.Length == 2 && int.TryParse(parts[1], out int score))
                    {
                        playerScores.Add((parts[0], score));
                    }
                }

                playerScores.Sort((a, b) => b.score.CompareTo(a.score));

                string summary = "";
                foreach (var ps in playerScores)
                {
                    summary += "👤 " + ps.player + ": " + ps.score + "\n";
                }

                txtOverlayScore.Text = summary;
            }
            else
            {
                txtOverlayScore.Text = "Không có dữ liệu kết quả.";
            }
        }



        private void ShowMessageAndClose(string message)
        {
            Dispatcher.Invoke(() =>
            {
                MessageBox.Show(message);
                Close();
            });
        }

        protected override void OnClosed(EventArgs e)
        {
            cts.Cancel();
            timer.Stop();
            base.OnClosed(e);
        }

        private void SendNextCommand()
        {
            try
            {
                if (client != null && client.Connected && stream != null)
                {
                    string nextCommand = "NEXT\n";
                    byte[] data = System.Text.Encoding.UTF8.GetBytes(nextCommand);
                    stream.Write(data, 0, data.Length);
                    stream.Flush();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("❌ Lỗi khi gửi lệnh NEXT: " + ex.Message);
            }
        }

        private void BtnKetQua_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("📊 Tính năng xem kết quả tổng thể đang phát triển hoặc hiển thị sau khi kết thúc toàn bộ câu hỏi!", "Thông báo", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void BtnTiepTuc_Click(object sender, RoutedEventArgs e)
        {
            gridOverlay.Visibility = Visibility.Collapsed;
            txtResult.Text = "";

            if (questionQueue.Count > 0)
            {
                ProcessQuestion(questionQueue.Dequeue());
                isWaitingResult = false;
                isNextPending = false;
            }
            else
            {
                isWaitingResult = false;
                isNextPending = true;
                txtQuestion.Text = "⏳ Đang chờ câu hỏi mới từ server...";
                SendNextCommand();
            }

            btnNext.Visibility = Visibility.Collapsed;
        }


        private void StartQuizUI()
        {
            // Reset trạng thái giao diện khi START quiz mới
            txtQuestion.Text = "⏳ Đang chờ câu hỏi từ server...";

            rdoA.Visibility = rdoB.Visibility = rdoC.Visibility = rdoD.Visibility = Visibility.Visible;
            rdoA.IsChecked = rdoB.IsChecked = rdoC.IsChecked = rdoD.IsChecked = false;

            btnTraLoi.Visibility = Visibility.Visible;
            btnTraLoi.IsEnabled = true;
            btnNext.Visibility = Visibility.Collapsed;

            gridOverlay.Visibility = Visibility.Collapsed;
            txtResult.Text = "";
            txtTime.Text = "";

            isWaitingResult = false;
            isNextPending = false;
            questionQueue.Clear();  // Xoá queue cũ nếu có
        }

        private async void BtnThoat_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (writer != null && client != null && client.Connected)
                {
                    // Gửi thông báo ngắt kết nối cho server
                    await writer.WriteLineAsync("QUIT");
                    await writer.FlushAsync();
                }

                // Dừng task nhận dữ liệu nếu có, ví dụ:
                cts?.Cancel();

                // Đóng stream và client
                reader?.Close();
                writer?.Close();
                client?.Close();
            }
            catch (Exception)
            {
                // Có thể log lỗi nếu cần
            }
            finally
            {
                Application.Current.Shutdown();
            }
        }


    }
}
