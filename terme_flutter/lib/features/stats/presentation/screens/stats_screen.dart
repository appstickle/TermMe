import 'package:flutter/material.dart';
import 'package:terme_flutter/core/widgets/terminal_panel.dart';
import 'package:terme_flutter/features/stats/domain/entities/chat_stats.dart';
import 'package:terme_flutter/features/stats/domain/repositories/stats_repository.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({
    required this.statsRepository,
    super.key,
  });

  final StatsRepository statsRepository;

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  ChatStats? _stats;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final stats = _stats;
    if (stats == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          TerminalPanel(
            title: 'stats 48h',
            child: Text(
              'messages=${stats.messagesLast48h}\n'
              'avg_len=${stats.averageMessageLength.toStringAsFixed(1)}\n'
              'avg_reply=${stats.averageResponseMinutes}m\n'
              'streak=${stats.streakDays}d',
            ),
          ),
          TerminalPanel(
            title: 'ascii graph',
            child: Text(_buildMiniBar(stats.messagesLast48h)),
          ),
        ],
      ),
    );
  }

  Future<void> _load() async {
    final data = await widget.statsRepository.loadMyStats();
    if (!mounted) {
      return;
    }
    setState(() => _stats = data);
  }

  String _buildMiniBar(int total) {
    final bars = (total / 2).round().clamp(1, 20);
    return '[${'=' * bars}>${'.' * (20 - bars)}]';
  }
}
