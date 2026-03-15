import 'package:terme_flutter/features/chat/domain/entities/terminal_message.dart';

abstract class MessageRepository {
  Future<void> sendMessage({
    required String toHandle,
    required String body,
  });

  Future<List<TerminalMessage>> listConversation({
    required String withHandle,
  });
}
