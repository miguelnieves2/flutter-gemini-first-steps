import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String geminiKey = dotenv.env['GEMINI_KEY'] ?? 'No hay API Key';
}
