import 'package:flutter/material.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Chat Page"),
      ),
    );
  }
}
