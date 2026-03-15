import 'package:terme_flutter/features/chat/domain/entities/terminal_message.dart';
import 'package:terme_flutter/features/chat/domain/repositories/message_repository.dart';

class InMemoryMessageRepository implements MessageRepository {
  final List<TerminalMessage> _messages = <TerminalMessage>[
    TerminalMessage(
      id: 'm1',
      senderHandle: '@friend',
      body: 'yo. this is your terminal ping.',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  @override
  Future<List<TerminalMessage>> listConversation({
    required String withHandle,
  }) async {
    return List.unmodifiable(_messages);
  }

  @override
  Future<void> sendMessage({
    required String toHandle,
    required String body,
  }) async {
    _messages.add(
      TerminalMessage(
        id: 'm${_messages.length + 1}',
        senderHandle: '@me',
        body: body,
        createdAt: DateTime.now(),
      ),
    );
  }
}
