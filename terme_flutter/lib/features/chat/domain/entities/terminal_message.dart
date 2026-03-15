class TerminalMessage {
  TerminalMessage({
    required this.id,
    required this.senderHandle,
    required this.body,
    required this.createdAt,
  });

  final String id;
  final String senderHandle;
  final String body;
  final DateTime createdAt;

  int get length => body.length;
}
