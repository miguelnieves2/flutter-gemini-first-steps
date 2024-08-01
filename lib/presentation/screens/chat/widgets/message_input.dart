import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_first_steps/domain/entities/message.dart';
import 'package:gemini_first_steps/presentation/providers/message_provider.dart';

class MessageInput extends ConsumerWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controlador para gestioner el teto del campo de entrada
    final TextEditingController _controller = TextEditingController();

    final geminiClient = ref.read(
      geminiClientProvider, // Usar Riverpod para acceder al cliente API
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            // key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 9),

                //
                FilledButton(
                  onPressed: () async {
                    // Se obtiene el texto del TextEditingController
                    final String text = _controller.text
                        .trim(); // Trim para eliminar espacios al inicio y final del texto

                    if (text.isNotEmpty) {
                      // Llama a addMessage de messageNotifierProvider
                      // Se envía el mensaje del usuario al `messageNotifierProvider`
                      // que actualiza la lista de mensajes mostrados en la UI.
                      ref
                          .read(messageNotifierProvider.notifier)
                          .addMessage(Message(text: text, isSentByMe: true));

                      // Limpia el campo de texto después de enviar
                      _controller.clear();

                      // Respuesta de Gemini
                      // Llamada asincronica a generateText de GeminiApiClient
                      // para obtener respuesta basada en el texto del usuario.
                      final response = await geminiClient.sendMessage(text);
                      // La respuesta obtenida se envia también al messageNotifierProvider
                      // que añade esta respuesta como un mensaje del modelo
                      ref.read(messageNotifierProvider.notifier).addMessage(
                          Message(text: response, isSentByMe: false));
                    }
                  },
                  // Configuración del estilo del botón
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(
                      Size(60, 60),
                    ),
                    elevation: MaterialStateProperty.all(8.0),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
