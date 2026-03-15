import 'package:flutter/material.dart';
import 'package:terme_flutter/core/theme/terminal_theme.dart';
import 'package:terme_flutter/core/widgets/terminal_panel.dart';
import 'package:terme_flutter/features/chat/domain/usecases/send_message_use_case.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.sendMessage,
    super.key,
  });

  final SendMessageUseCase sendMessage;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _targetController = TextEditingController(text: '@highschoolbro');
  final _inputController = TextEditingController();
  final List<String> _terminalLog = <String>[
    'system> welcome to terme',
    'hint> /ok  /ack busy  /eta 2h',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TerminalPanel(
            title: 'chat',
            child: ListView.builder(
              itemCount: _terminalLog.length,
              itemBuilder: (context, index) {
                return Text(_terminalLog[index]);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: _targetController,
                style: const TextStyle(color: TerminalColors.green),
                decoration: const InputDecoration(labelText: 'target handle'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      style: const TextStyle(color: TerminalColors.green),
                      decoration: const InputDecoration(
                        labelText: 'message or command',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _submit,
                    child: const Text('send'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    final target = _targetController.text.trim();
    final input = _inputController.text.trim();
    if (target.isEmpty || input.isEmpty) {
      return;
    }

    try {
      await widget.sendMessage(toHandle: target, body: input);
      setState(() {
        _terminalLog.add('me>$target $input');
      });
      _inputController.clear();
    } catch (error) {
      setState(() {
        _terminalLog.add('error> $error');
      });
    }
  }
}
