   M S B A M L   `   `   `  ����   
ClientUers    ClientApp.MainClient   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$%  🎮 Game Trắc Nghiệm Nhanh��$	��600��$	��700�� � WindowStartupLocation$ CenterScreen=�����  �� 
StartPoint$	 0,0&� �� EndPoint$	 1,1&�.���  � Color$ 	#FF1E1E2F�� � Offset$	 0.0Q�� $ 	#FF1E1E2F��$	 1.0Q� � 	Resources 3  -System.Windows.Media.Effects.DropShadowEffect   
DropShadow   
BlurRadius   ShadowDepth	   	Direction
   Color   Opacity  FadeInStoryboard �� TargetProperty W� From	 W� To g� Duration  AnswerOptionA �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius �� Padding J� Effect �� Triggers P� Property P� Value �� 
TargetName  AnswerOptionB �� BasedOn  AnswerOptionC  AnswerOptionD  RoundedButtonStyle��%	  &	        &	 6     &	 o     7   &	 ]    7  7   &	 �    7  7   &	 �    7  7   &	     7     $ 10Q�$ 2Q�$		 320Q�$
 Black��$	 0.3Q��� .��W� $ Opacity�$ 0X�$ 1X�$ 0:0:0.5D��� " 	�.���  � �� �� " 	�.R��� $ border�����#F44336���#D32F2F$��2q�$ 20��$ 18q�$��8q�8   ._��� $��Center=�$��Center=�$��18(�$��SemiBold"�
������� P�  �@d�	IsChecked$
 TrueY�. ��� $ border�� � �� �#FFCDD2�� $ border�� � �� �#C62828P�  �@J�IsMouseOver . . ��� $ border�� � �� �#E57373��  � ��
 �������  � ��$ 18(���  � ��$
 Bold"���  � ��$ Center=��� " 	�8   .���  � �� �� " 	�.R��� $ border�����#2196F3���#1976D2$��2q�$ 20��$ 18q�$��8q�8  ._��� $��Center=�$��Center=�$��18(�$��SemiBold"�
������� P�  �@d�	IsChecked$
 TrueY�. ��� $ border�� � �� �#BBDEFB�� $ border�� � �� �#1565C0P�  �@J�IsMouseOver . . ��� $ border�� � �� �#64B5F6�� " 	�8   .���  � �� �� " 	�.R��� $ border�����#4CAF50���#388E3C$��2q�$ 20��$ 18q�$��8q�8  ._��� $��Center=�$��Center=�$��18(�$��SemiBold"�
������� P�  �@d�	IsChecked$
 TrueY�. ��� $ border�� � �� �#C8E6C9�� $ border�� � �� �#2E7D32P�  �@J�IsMouseOver . . ��� $ border�� � �� �#81C784�� " 	�8   .���  � �� �� " 	�.R��� $ border�����#FB8C00���#EF6C00$��2q�$ 20��$ 18q�$��8q�8  ._��� $��Center=�$��Center=�$��18(�$��SemiBold"�
������� P�  �@d�	IsChecked$
 TrueY�. ��� $ border�� � �� �#FFE0B2�� $ border�� � �� �#E65100P�  �@J�IsMouseOver . . ��� $ border�� � �� �#FFB74D�� " ��.���  � �� �#2196F3��  � ��
 �������  � ��$ 16(���  � ��$ SemiBold"���  � ��$
 10,5q���  � ��$ 0q���  �@�Cursor$
 Hand����  � �� �� " ��.R��� #��z��$ 20��# z��8   ._��� $��Center=�$��Center=� P�  �@J�IsMouseOver . . ���  � �� �#1976D2P�  � �� . . ���  � �� �#0D47A1.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� -    ��Name$ cbTopic��$	��200��$��	0,10,0,10q�.@��� $��Toán���� $��Lịch sử���� $
��Văn���� $��
Địa lý���� $��0��$	��0,5q�$ 10q����#263238$ 10��# [  ._���  �� Orientation$ 
Horizontal=�$��Center=�$��Center=�.+��� $��👤 Người chơi:��
�������$
��Bold"�$��Center=�$��5q��� -     ��Name$  txtUsername��$	��120��$��5q�! �� 
IsReadOnly! . ���#E3F2FD���#90CAF9$��1q�$��3q��� $��🌐 Server:��
�������$
��Bold"�$��Center=�$��5q��� -   $  txtServerIP��$	��150��$��5q�! . ���#E3F2FD���#90CAF9$��1q�$��3q��� $��1��$	��0,5q�$ 10q����#37474F$ 10��$��Center=�# [  ._��� $ 
Horizontal=�$��Center=�.+��� $��⏱ Thời gian:��
�������$��16(�$
��Bold"�$��5q��� -   " ��Name$" txtTime��$��16(�$
��Bold"����#FFCA28$��5q�$	��--s���� $��2�����#FFF9C4$ 15��$ 15q�$
��0,10q����#FBC02D$��2q�# [  ._��� $ 
Horizontal=�$��Center=�.+��� $	��❓��$��24(�$��0,0,10,0q�$	��Top=��� $
��Auto=�$	��120��.���� -   $" txtQuestion��$��20(�$��SemiBold"����#3E2723$
��Wrap=�$5��/⏳ Câu hỏi sẽ hiển thị tại đây...���� $��3��$ 15��$ 10q�$
��0,10q����#E3F2FD# [  ._�A� # A� Columns$# 2��$ A� Rows$$ 2��$��Stretch=�$��Center=�.+�	� -   % 	�Name$
% rdoA��$��A. ...��& 	� 	GroupName$& AnswerGroup��#��[ 	� -   $
% rdoB��$��B. ...��$& AnswerGroup��#��[ 	� -   $
% rdoC��$��C. ...��$& AnswerGroup��#��[ 	� -	   $
% rdoD��$��D. ...��$& AnswerGroup��#��[ �� -
   $" 	txtResult��$��4��$�� ��$��18(�$
��Bold"�
���   �' �� TextAlignment$' Center=�$��10q��� $��5��$ 
Horizontal=�$��Center=�$��	0,10,0,10q�.+��� -   ( ��Name$( 	btnTraLoi��$��✅ Trả lời��$	��150��$��45��$��10q�#��[ �� -   $( 	btnKetQua��$��📊 Xem kết quả��$	��150��$��45��$��10q�#��[ �� -   $( btnNext��$��Câu tiếp theo��$	��150��$��45��$��10q�#��[ $y�	Collapsed=�� -   ) �Name$) gridOverlay�����	#CCFFFFFF$y�	Collapsed=�$��6��* K� ZIndex$	* 999��.+��� 
�������$ 20q�$ 15�����#4CAF50$��3q�$��Center=�$��Center=�# [  ._��� $��Center=�.+��� -   $" txtOverlayResult��$��🎉 Đúng rồi!��$��24(�$
��Bold"����#388E3C$' Center=�$��10q��� -   $" txtOverlayScore��$��(+10 điểm)��$��18(�$��SemiBold"����#1976D2$' Center=�$��5q��� -   $( 
btnTiepTuc��$��▶ Tiếp tục��$	��120��$��40��$��10q�#��[ �� -   $( btnXemKetQua��$��📊 Xem kết quả��$	��150��$��45��$��10q�#��[ $y�	Collapsed=��� -   $( btnThoat��$��
❌ Thoát��$	��150��$��45��$��10q�#��[ $y�	Collapsed=�