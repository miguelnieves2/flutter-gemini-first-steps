// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_first_steps/presentation/providers/theme_provider.dart';

import 'package:gemini_first_steps/presentation/screens/chat/widgets/message_input.dart';
import 'package:gemini_first_steps/presentation/screens/chat/widgets/message_list.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter + AI'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.brightness_2),
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: const Column(
//         children: [
//           Expanded(child: MessageList()),
//           // Widget inferior
//           MessageInput(),
//         ],
//       ),
//     );
//   }
// }

class ChatScreen extends ConsumerWidget {
  static const name = 'home-screen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final isDarkMode = theme.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + AI'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.light_mode_rounded)
                : const Icon(
                    Icons.dark_mode_rounded,
                  ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: MessageList()),
          // Widget inferior
          MessageInput(),
        ],
      ),
    );
  }
}
