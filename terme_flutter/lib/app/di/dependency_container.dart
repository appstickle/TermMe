import 'package:terme_flutter/features/chat/data/in_memory_message_repository.dart';
import 'package:terme_flutter/features/chat/domain/repositories/message_repository.dart';
import 'package:terme_flutter/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:terme_flutter/features/friends/data/in_memory_friend_repository.dart';
import 'package:terme_flutter/features/friends/domain/repositories/friend_repository.dart';
import 'package:terme_flutter/features/friends/domain/usecases/search_users_use_case.dart';
import 'package:terme_flutter/features/friends/domain/usecases/send_invite_use_case.dart';
import 'package:terme_flutter/features/stats/data/in_memory_stats_repository.dart';
import 'package:terme_flutter/features/stats/domain/repositories/stats_repository.dart';

class DependencyContainer {
  DependencyContainer({
    required this.messageRepository,
    required this.friendRepository,
    required this.statsRepository,
    required this.sendMessageUseCase,
    required this.searchUsersUseCase,
    required this.sendInviteUseCase,
  });

  final MessageRepository messageRepository;
  final FriendRepository friendRepository;
  final StatsRepository statsRepository;

  final SendMessageUseCase sendMessageUseCase;
  final SearchUsersUseCase searchUsersUseCase;
  final SendInviteUseCase sendInviteUseCase;

  factory DependencyContainer.build() {
    final messageRepository = InMemoryMessageRepository();
    final friendRepository = InMemoryFriendRepository();
    final statsRepository = InMemoryStatsRepository();

    return DependencyContainer(
      messageRepository: messageRepository,
      friendRepository: friendRepository,
      statsRepository: statsRepository,
      sendMessageUseCase: SendMessageUseCase(messageRepository),
      searchUsersUseCase: SearchUsersUseCase(friendRepository),
      sendInviteUseCase: SendInviteUseCase(friendRepository),
    );
  }
}
