import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  List<ChatUser> _typing = <ChatUser>[];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "goatMitra",
      profileImage:
          "https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Gemini_SS.width-1300.jpg");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('goatMitra Chat',style:TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: _buildUI()
        ),
    );
  }

  Widget _buildUI() {
    return DashChat(
      typingUsers: _typing,
      currentUser: currentUser, 
      onSend: _sendMessage,
      messages: messages,
      inputOptions: const InputOptions(
        inputDecoration: InputDecoration(
          
        ),
        alwaysShowSend: true,
        cursorStyle: CursorStyle(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
      _typing = [geminiUser];
    });

    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String? response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(() {
            _typing = [];
            messages = [lastMessage!, ...messages];
          });
        } else {
          String? response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            _typing = [];
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}