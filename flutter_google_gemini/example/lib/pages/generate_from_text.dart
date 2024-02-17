// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_google_gemini/flutter_google_gemini.dart';
import 'package:uuid/uuid.dart';

String randomString() {
  var uuid = const Uuid();
  return uuid.v1();
}

class GenerateFromText extends StatefulWidget {
  const GenerateFromText({super.key});

  @override
  State<GenerateFromText> createState() => _GenerateFromTextState();
}

class _GenerateFromTextState extends State<GenerateFromText> {
  var uuid = const Uuid();
  types.User? _user1;
  types.User? _user2;
  @override
  void initState() {
    _user1 = types.User(id: uuid.v4());
    _user2 = types.User(id: uuid.v4());
    super.initState();
  }

  final List<types.Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Generate from Text"),
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user1!,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user1!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );
    _addMessage(textMessage);
    handleTyping();
    await generateContent(prompt: message.text);
  }

  void handleTyping() {
    final textMessage = types.TextMessage(
      author: _user2!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: 'Typing ....',
    );
    _addMessage(textMessage);
  }

  Future<void> generateContent({required String prompt}) async {
    String? text = await FlutterGoogleGemini.text(prompt: prompt);
    final textMessage = types.TextMessage(
      author: _user2!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: text ?? '',
    );
    _messages.removeLast();
    _addMessage(textMessage);
  }
}
