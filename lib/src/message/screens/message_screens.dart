
import 'package:flutter/material.dart';
import 'package:real_estate_app/style/colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
          child: const Row(
            children: [],
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: AppColors.darkAmber,
          )
        ],
      ),
    );
  }
}
