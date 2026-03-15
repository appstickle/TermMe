import 'package:terme_flutter/features/stats/domain/entities/chat_stats.dart';

abstract class StatsRepository {
  Future<ChatStats> loadMyStats();
}
