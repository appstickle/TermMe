class ChatStats {
  ChatStats({
    required this.messagesLast48h,
    required this.averageMessageLength,
    required this.averageResponseMinutes,
    required this.streakDays,
  });

  final int messagesLast48h;
  final double averageMessageLength;
  final int averageResponseMinutes;
  final int streakDays;
}
