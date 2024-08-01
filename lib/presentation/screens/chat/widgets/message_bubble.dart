import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    // Colores
    // Acceder al ColorScheme actual
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColor = colorScheme.primaryContainer;
    final secondaryColor = colorScheme.surfaceVariant;

    // Dimensiones
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: _MessageContainer(
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        mediaQueryWidth: mediaQueryWidth,
        // Info
        message: message,
        isSentByMe: isSentByMe,
      ),
    );
  }
}

class _MessageContainer extends StatelessWidget {
  const _MessageContainer({
    required this.colorScheme,
    required this.primaryColor,
    required this.secondaryColor,
    required this.mediaQueryWidth,
    // Info
    required this.message,
    required this.isSentByMe,
  });

  final ColorScheme colorScheme;
  final Color primaryColor;
  final Color secondaryColor;
  final double mediaQueryWidth;
  // Info
  final String message;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ), // Margen externo para separación
      child: Material(
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
        color: isSentByMe ? primaryColor : secondaryColor, // Color de fondo
        elevation: 2, // Elevación para efecto de sombra
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 8), // Padding interno del texto
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: mediaQueryWidth *
                    0.68 // Máximo 68% del ancho de la pantalla
                ),
            // Texto
            child: _TextMessage(
              message: message,
              isSentByMe: isSentByMe,
              colorScheme: colorScheme,
            ),
          ),
        ),
      ),
    );
  }
}

class _TextMessage extends StatelessWidget {
  const _TextMessage({
    required this.message,
    required this.isSentByMe,
    required this.colorScheme,
  });

  final String message;
  final bool isSentByMe;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: isSentByMe
            ? colorScheme.onPrimaryContainer
            : colorScheme.onSurfaceVariant, // Color del texto
      ),
    );
  }
}
