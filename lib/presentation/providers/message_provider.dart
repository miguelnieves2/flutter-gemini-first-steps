import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_first_steps/data/repositories/gemini_api_client.dart';
import 'package:gemini_first_steps/domain/entities/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// > Gemini API
// Al tener toda la solicitud de Gemini en un archivo independiente
// y que no necesta manejar estados o cambios de estado. Se usa 'Provider'
// simplemente para proporcionar un valor o una instancia y lo reutiliza
// a lo largo de la vida útil de la app
final geminiClientProvider = Provider<GeminiApiClient>((ref) {
  return GeminiApiClient();
});

// > Lista de mensajes
// StateNotifierProvider permite mantener un estado complejo
// Manejar estados cambiantes de manera más estructurada y actualizar la UI
// o cualquier otro componente suscrito automáticamente cuando el estado cambia.

// Ese estado es administrado por MessageNotifier, que es la clase que se crea
// y el StateNotiferProvider es de tipo List<Message>
//
// StateNotifierProvider <Controlador (MessageNotifier), Estado (Estancia de List<Message>>)>
final messageNotifierProvider =
    StateNotifierProvider<MessageNotifier, List<Message>>(
  (ref) => MessageNotifier(), // Estancia a MessageNotifier
);

class MessageNotifier extends StateNotifier<List<Message>> {
  // Inicializa una lista vacía
  MessageNotifier() : super([]);

  // Método para añadir mensajes a la lista.
  void addMessage(Message message) {
    // Añade un nuevo mensaje a la lista y notifica a los consumidores del cambio
    state = [
      ...state,
      message
    ]; // Crea una nueva lista con todos los mensajes anteriores más el nuevo
  }
}
