   M S B A M L   `   `   `  ����   ServerTN    QuizServer.KTServer   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Quiz Server��$	��500��$	��800�� � WindowStyle$ SingleBorderWindow=� � 
ResizeMode$ 	CanResize=����#F5F7FA � 	Resources    ModernButton �� 
TargetType �� Property �� Value �� 
TargetType �� CornerRadius	 �� Triggers
 P� Property P� Value  
LabelStyle��%)  &	        &	 �    �� " ��.���  � �� �#0078D4��  � ��
 �������  � ��$ 14(���  � ��$ Segoe UI)���  � ��$
 10,5q���  � ��$	 5,0q���  � ��$ 0q���  � �� �� " ��.R��� #��z��$ 5��$��0q�._��� $��Center=�$��Center=�	 P� 
 �@J�IsMouseOver . . ���  � �� �#005EA6P� 
 � {� .  . ���  � �� �#A0A0A0��  � �� �#D0D0D0�� " ��.���  � ��$ Segoe UI)���  � ��$ 14(���  � ��$ Center=���  � ��$	 5,0q�.��� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+���  �� Orientation$ 
Horizontal=�$��0��$��0,0,0,15q�.+��� $��Port:��#��[ $��SemiBold"��� -    ��Name$ txtPort��$	��100��$
��5000��$
��10,0q�$��14(�$��5q�$��Center=����#0078D4$��1q����#FFFFFF�� -    ��Name$ btnStartServer��#��[  .���� $ 
Horizontal=�.+��� $	��▶��$��16(�$��0,0,5,0q�$��Center=��� $��Start Server���� -   $ btnStopServer��#��[  {�.  .���� $ 
Horizontal=�.+��� $	��■��$��16(�$��0,0,5,0q�$��Center=��� $��Stop Server���� -    ��Name$ lblServerStatus��#��[ ���#2E7D32$
��Bold"��� $ 
Horizontal=�$��1��$��0,0,0,15q�.+��� $��Database Status:��#��[ $��SemiBold"��� -   $ lblDbStatus��#��[ ���#0288D1�� -   $ lblQuestionCount��#��[ ���#388E3C$
��15,0q��� $ 
Horizontal=�$��2��$��0,0,0,15q�.+��� -   $ btnStartQuiz��#��[  {�.  .���� $ 
Horizontal=�.+��� $
��🧠��$��16(�$��0,0,5,0q�$��Center=��� $��
Start Quiz���� -   $ lblQuizStatus��#��[ ���#01579B$
��Bold"��� $��Server Logs��$��4�����#0078D4$��1q����#FFFFFF$��10q�.���� -	   $ txtLog�� �� 
IsReadOnly .  �� TextWrapping$
 Wrap=�" �� VerticalScrollBarVisibility$
 Auto=�$��12(����#FAFAFA���#E0E0E0$��1q�