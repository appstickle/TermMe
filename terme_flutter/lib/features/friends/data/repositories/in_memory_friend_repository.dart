import 'package:terme_flutter/features/friends/domain/entities/friend_user.dart';
import 'package:terme_flutter/features/friends/domain/repositories/friend_repository.dart';

class InMemoryFriendRepository implements FriendRepository {
  final List<FriendUser> _users = <FriendUser>[
    FriendUser(id: 'u1', handle: '@highschoolbro'),
    FriendUser(id: 'u2', handle: '@terminaldad'),
    FriendUser(id: 'u3', handle: '@cryptobuddy'),
  ];

  @override
  Future<List<FriendUser>> searchByHandle(String query) async {
    return _users
        .where((user) => user.handle.toLowerCase().contains(query.toLowerCase()))
        .toList(growable: false);
  }

  @override
  Future<void> sendInvite({
    required String targetHandle,
  }) async {
    return;
  }
}
