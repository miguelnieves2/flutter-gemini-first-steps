# Gemini Flutter Chat App
#### gemini_first_steps

This project is a basic chat application built with Flutter, leveraging the Gemini API through its Flutter SDK. The app maintains chat context within a session but does not currently store conversations locally or in the cloud.

## Features

- Basic chat interface
- Integration with Gemini API
- Conversation context maintained within app session
- Theme switching capability

## Project Structure

```
gemini_first_steps/
├── lib/
│   ├── config/
│   │   ├── theme/app_theme.dart
│   │   │   └── constants/enviroment.dart
│   │   └── router/app_router.dart
│   ├── data/
│   │   ├── models/
│   │   └── repositories/gemini_api_client.dart
│   ├── domain/
│   │   └── entities/message.dart
│   ├── presentation/
│   │   ├── providers/
│   │   │   └── message_provider.dart
│   │   │   └── theme_provider.dart
│   │   ├── screens/
│   │   │   └── chat/
│   │   │       ├── chat_screen.dart
│   │   │       └── widgets/
│   │   │           ├── message_bubble.dart
│   │   │           └── message_input.dart
│   │   │           └── message_list.dart
│   ├── main.dart
└── pubspec.yaml
```

## Prerequisites

- Flutter SDK
- Dart SDK
- An API key from Google AI Studio

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/miguelnieves2/flutter-gemini-first-steps.git
   ```

2. Navigate to the project directory:
   ```
   cd flutter-gemini-first-steps
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Set up your Gemini API key:
   - Go to [Google AI Studio](https://aistudio.google.com/app) to obtain your API key
   - Open `lib/data/repositories/gemini_api_client.dart`
   - Replace `Enviroment.geminiKey` with your actual API key:
     ```dart
     GeminiApiClient() {
       model = GenerativeModel(
         model: 'gemini-1.5-flash',
         apiKey: 'YOUR_API_KEY_HERE',
       );
     ```
   - Alternatively, you can use `flutter_dotenv` to securely store your API key (recommended for production)

5. Run the app:
   ```
   flutter run
   ```

## Dependencies

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv): For environment variable management
- [go_router](https://pub.dev/packages/go_router): For navigation
- [google_generative_ai](https://pub.dev/packages/google_generative_ai): Gemini API SDK
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): For state management (dev dependency)

## Usage

After launching the app, you can start chatting with the Gemini AI. The conversation context is maintained within the app session, but please note that closing the app will reset the conversation.
