import 'package:terme_flutter/features/stats/domain/entities/chat_stats.dart';
import 'package:terme_flutter/features/stats/domain/repositories/stats_repository.dart';

class InMemoryStatsRepository implements StatsRepository {
  @override
  Future<ChatStats> loadMyStats() async {
    return ChatStats(
      messagesLast48h: 17,
      averageMessageLength: 31.2,
      averageResponseMinutes: 48,
      streakDays: 6,
    );
  }
}
