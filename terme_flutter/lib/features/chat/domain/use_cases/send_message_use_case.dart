import 'package:terme_flutter/features/chat/domain/repositories/message_repository.dart';

class SendMessageUseCase {
  SendMessageUseCase(this._repository);

  final MessageRepository _repository;

  Future<void> call({
    required String toHandle,
    required String body,
  }) async {
    if (body.trim().isEmpty) {
      throw ArgumentError('Message cannot be empty');
    }
    await _repository.sendMessage(toHandle: toHandle, body: body.trim());
  }
}
