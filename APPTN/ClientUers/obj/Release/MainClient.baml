   M S B A M L   `   `   `  ����   
ClientUers    ClientApp.MainClient   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$%  🎮 Game Trắc Nghiệm Nhanh��$	��600��$	��700�����#FAFAFA � WindowStartupLocation$ CenterScreen=� � 	Resources 3  -System.Windows.Media.Effects.DropShadowEffect   
DropShadow   Color   
BlurRadius   	Direction   ShadowDepth  AnswerOptionStyle �� 
TargetType �� Property	 �� Value
 �� 
TargetType ��Name �� CornerRadius �� Padding J� Effect �� Triggers P� Property P� Value �� 
TargetName  RoundedButtonStyle��%�  &	        &	 *     &	 �      $
 Gray��$ 8Q�$	 270Q�$ 2Q��� " 	�.���  � ��	 �� "
 	�.R��� $ border��$��2q����#1E88E5
�������$ 12��$��5q�$ 15q�# �   ._��� $��Center=�$��Center=� P�  �@d�	IsChecked$
 TrueY�. ��� $ border�� � ��	 �#C8E6C9�� $ border�� � ��	 �#2E7D32P�  �@J�IsMouseOver . . ��� $ border�� � ��	 �#64B5F6��  � ��$	 SemiBold"���  � ��$	 16(���  � ��
	 �   ���  � ��$	 Center=��� " ��.���  � ��	 �#2196F3��  � ��
	 �������  � ��$	 16(���  � ��$	 SemiBold"���  � ��$
	 10,5q���  � ��$	 0q���  �@�Cursor$
	 Hand����  � ��	 �� "
 ��.R��� #��z��$ 20��# z��# �   ._��� $��Center=�$��Center=� P�  �@J�IsMouseOver . . ���  � ��	 �#1976D2P�  � �� . . ���  � ��	 �#0D47A1.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+���  �� Orientation$ 
Horizontal=�$��0��$	��0,5q�.+��� $��👤 Người chơi:��$
��Bold"�$��Center=�$��5q��� -    ��Name$ txtUsername��$	��120��$��5q� �� 
IsReadOnly . ���#E3F2FD�� $��🌐 Server:��$
��Bold"�$��Center=�$��5q��� -   $ txtServerIP��$	��150��$��5q� . ���#E3F2FD�� $ 
Horizontal=�$��1��$��Center=�$
��0,10q�.+��� $��⏱ Thời gian:��$��16(�$
��Bold"�$��5q��� -    ��Name$ txtTime��$��16(�$
��Bold"����#D84315$��5q�$	��--s���� $��2�����#FFFDE7$ 10��$ 15q�$
��0,10q����#FFB300$��2q�._��� $
��Auto=�$��80��.���� -   $ txtQuestion��$��18(�$
��Wrap=�$��SemiBold"����#37474F$5��/⏳ Câu hỏi sẽ hiển thị tại đây...���� $��3��$ 15��$ 10q�$
��0,10q����#E3F2FD# [  ._�A�  A� Columns$ 2�� A� Rows$ 2��$��Stretch=�$��Center=�.+�	� -    	�Name$
 rdoA��$��A. ...�� 	� 	GroupName$ AnswerGroup��#��[ 	� -   $
 rdoB��$��B. ...��$ AnswerGroup��#��[ 	� -   $
 rdoC��$��C. ...��$ AnswerGroup��#��[ 	� -   $
 rdoD��$��D. ...��$ AnswerGroup��#��[ �� -	   $ 	txtResult��$��4��$�� ��$��18(�$
��Bold"�
���   � �� TextAlignment$ Center=�$��10q��� $��5��$ 
Horizontal=�$��Center=�$��	0,10,0,10q�$	��349��.+��� -
    ��Name$ 	btnTraLoi��$��✅ Trả lời��$	��150��$��45��$��10q�#��[ �� -   $ 	btnKetQua��$��📊 Xem kết quả��$	��150��$��45��$��10q�#��[ �� -   $ btnNext��$��Câu tiếp theo��$	��150��$��45��$��10q�#��[ $y�	Collapsed=�� -    �Name$ gridOverlay�����	#CCFFFFFF$y�	Collapsed=�$��6�� K� ZIndex$	 999��.+��� 
�������$ 20q�$ 15�����#4CAF50$��3q�$��Center=�$��Center=�# [  ._��� $��Center=�.+��� -   $ txtOverlayResult��$��🎉 Đúng rồi!��$��24(�$
��Bold"����#388E3C$ Center=�$��10q��� -   $ txtOverlayScore��$��(+10 điểm)��$��18(�$��SemiBold"����#1976D2$ Center=�$��5q��� -   $ 
btnTiepTuc��$��▶ Tiếp tục��$	��120��$��40��$��10q�#��[ �� -   $ btnThoat��$��
❌ Thoát��$	��150��$��45��$��10q�#��[ $y�	Collapsed=�