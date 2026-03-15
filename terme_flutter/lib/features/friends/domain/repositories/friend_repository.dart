import 'package:terme_flutter/features/friends/domain/entities/friend_user.dart';

abstract class FriendRepository {
  Future<List<FriendUser>> searchByHandle(String query);

  Future<void> sendInvite({
    required String targetHandle,
  });
}
