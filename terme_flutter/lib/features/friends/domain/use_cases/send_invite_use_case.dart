import 'package:terme_flutter/features/friends/domain/repositories/friend_repository.dart';

class SendInviteUseCase {
  SendInviteUseCase(this._repository);

  final FriendRepository _repository;

  Future<void> call(String targetHandle) async {
    final normalized = targetHandle.trim();
    if (!normalized.startsWith('@')) {
      throw ArgumentError('Handle must start with @');
    }
    await _repository.sendInvite(targetHandle: normalized);
  }
}
