import 'package:flutter/material.dart';
import 'package:terme_flutter/core/widgets/terminal_panel.dart';
import 'package:terme_flutter/features/friends/domain/entities/friend_user.dart';
import 'package:terme_flutter/features/friends/domain/use_cases/search_users_use_case.dart';
import 'package:terme_flutter/features/friends/domain/use_cases/send_invite_use_case.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({
    required this.searchUsers,
    required this.sendInvite,
    super.key,
  });

  final SearchUsersUseCase searchUsers;
  final SendInviteUseCase sendInvite;

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final _queryController = TextEditingController();
  List<FriendUser> _results = const [];
  String _status = 'system> use /find @handle';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TerminalPanel(
          title: 'friends',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_status),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _queryController,
                      decoration: const InputDecoration(
                        labelText: 'search handle, ex: @highschoolbro',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _search,
                    child: const Text('find'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TerminalPanel(
            title: 'results',
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final user = _results[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(user.handle),
                    TextButton(
                      onPressed: () => _invite(user.handle),
                      child: const Text('invite'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _search() async {
    final query = _queryController.text.trim();
    final results = await widget.searchUsers(query);
    setState(() {
      _results = results;
      _status = 'system> ${results.length} handle(s) found';
    });
  }

  Future<void> _invite(String handle) async {
    await widget.sendInvite(handle);
    setState(() {
      _status = 'system> invite sent to $handle';
    });
  }
}
