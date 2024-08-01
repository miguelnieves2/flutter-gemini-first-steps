import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:gemini_first_steps/config/theme/constants/enviroment.dart';

class GeminiApiClient {
  late final GenerativeModel model;
  late final ChatSession chatSession;

  GeminiApiClient() {
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: Enviroment.geminiKey,
    );

    // Inicia una nueva sesión de chat al crear el cliente
    chatSession = model.startChat();
  }

  // Método para enviar un mensaje y recibir una respuesta
  Future<String> sendMessage(String messageText) async {
    var response = await chatSession.sendMessage(Content.text(messageText));
    return response.text ?? "No response generated.";
  }
}
