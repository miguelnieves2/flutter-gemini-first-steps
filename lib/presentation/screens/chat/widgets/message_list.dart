import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_first_steps/presentation/providers/message_provider.dart';
import 'package:gemini_first_steps/presentation/screens/chat/widgets/message_bubble.dart';

class MessageList extends ConsumerWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(
        messageNotifierProvider); // Observa los cambios en messageNotifierProvider

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageBubble(
          message: messages[index].text,
          isSentByMe: messages[index].isSentByMe,
        );
      },
    );
  }
}
