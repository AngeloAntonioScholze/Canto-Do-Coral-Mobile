import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BotNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;

  BotNavBar({this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign_outlined),
                label: 'Notícias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_outlined),
                label: 'Vídeos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Exercícios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Eventos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'Mais',
              )
            ],
            currentIndex: selectedIndex,
            onTap: onTap,
            activeColor: Colors.green[900],
            inactiveColor: Colors.black,
          )
        : BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign_outlined),
                label: 'Notícias',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_outlined),
                label: 'Videos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Exercícios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Eventos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'Mais',
              ),
            ],
            selectedItemColor: Colors.green[900],
            currentIndex: selectedIndex,
            onTap: onTap,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
          );
  }
}
