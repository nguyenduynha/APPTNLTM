   M S B A M L   `   `   `  ����   
ClientUers    QuizClient.LoginClientTN   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$.  (🎮 Đăng nhập chơi trắc nghiệm��$	��400��$	��420�����	#FF1E1E2F � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=�$��Segoe UI)�.��� $��20q�.+���  �� CornerRadius$ 15�����#2C2F48 �� Padding$ 20q�._��  � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��🚀 ĐĂNG NHẬP��$��26(�$
��Bold"����	#FFC6E2FF$��Center=�$��0,0,0,20q�$��0���� $��1�� �� Orientation$ Vertical=�$��0,0,0,10q�$��Center=�.+��� $��👤 Tên người chơi��
�������$��14(�$��0,0,0,5q��� $ 6�����#3C3F5C���#5A5D78$��1q�._��� -    ��Name$ txtPlayerName��$	��250��$��14(�$��8q�
������ 
�������$��0q��� $��2��$ 
Horizontal=�$��Center=�$��0,0,0,10q�.+��� $ Vertical=�$��0,0,10,0q�.+��� $��🌐 IP Server��
�������$��14(�$��0,0,0,5q��� $ 6�����#3C3F5C���#5A5D78$��1q�._��� -   $ txtServerIP��$��	127.0.0.1��$	��140��$��14(�$��8q�
������ 
�������$��0q��� $ Vertical=�.+��� $��	🔌 Port��
�������$��14(�$��0,0,0,5q��� $ 6�����#3C3F5C���#5A5D78$��1q�._��� -   $ txtPort��$
��5000��$��80��$��14(�$��8q�
������ 
�������$��0q��� $��3��$ 
Horizontal=�$��Center=�.+��� -   $��🎯 BẮT ĐẦU ��$	��150��$��40��$��14(����	#FF3A86FF
�������
������  � Cursor$
 Hand��$��0,10,0,0q����� 	 �� 
TargetType"	 ��.��� 
 �� Property
 �@J�Effect �� Value 3  -System.Windows.Media.Effects.DropShadowEffect     
BlurRadius$ 10Q�   ShadowDepth$ 2Q�   Color$ #4DA6FF���� 
 � �� ��  �� 
TargetType" ��.R��� #��z��$ 10��#��z��$��0q�._��� $��Center=�$��Center=� �� Triggers P�  P� Property �@J�IsMouseOver P� Value . . ��� 
 � �� �	#FF5C9EFF