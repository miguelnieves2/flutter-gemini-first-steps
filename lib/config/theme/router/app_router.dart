import 'package:gemini_first_steps/presentation/screens/chat/chat_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: ChatScreen.name,
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);
