import 'package:flutter/material.dart';
import 'package:terme_flutter/app/di/dependency_container.dart';
import 'package:terme_flutter/core/theme/terminal_theme.dart';
import 'package:terme_flutter/features/chat/presentation/screens/chat_screen.dart';
import 'package:terme_flutter/features/friends/presentation/screens/friends_screen.dart';
import 'package:terme_flutter/features/stats/presentation/screens/stats_screen.dart';

class TerMeApp extends StatefulWidget {
  const TerMeApp({super.key});

  @override
  State<TerMeApp> createState() => _TerMeAppState();
}

class _TerMeAppState extends State<TerMeApp> {
  final _dependencies = DependencyContainer.build();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      ChatScreen(sendMessage: _dependencies.sendMessageUseCase),
      FriendsScreen(
        searchUsers: _dependencies.searchUsersUseCase,
        sendInvite: _dependencies.sendInviteUseCase,
      ),
      StatsScreen(statsRepository: _dependencies.statsRepository),
    ];

    return MaterialApp(
      title: 'TerMe',
      theme: terminalTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TerMe // terminal messenger'),
        ),
        body: IndexedStack(index: _selectedIndex, children: tabs),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: TerminalColors.green,
          unselectedItemColor: TerminalColors.dimGreen,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'stats',
            ),
          ],
        ),
      ),
    );
  }
}
