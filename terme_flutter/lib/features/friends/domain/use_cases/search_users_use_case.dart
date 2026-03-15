import 'package:terme_flutter/features/friends/domain/entities/friend_user.dart';
import 'package:terme_flutter/features/friends/domain/repositories/friend_repository.dart';

class SearchUsersUseCase {
  SearchUsersUseCase(this._repository);

  final FriendRepository _repository;

  Future<List<FriendUser>> call(String query) async {
    final normalized = query.trim();
    if (normalized.isEmpty) {
      return const [];
    }
    return _repository.searchByHandle(normalized);
  }
}
