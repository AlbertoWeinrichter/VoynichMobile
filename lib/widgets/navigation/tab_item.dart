
import 'package:flutter/material.dart';

enum TabItem { home, account }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(title: 'Home', icon: Icons.home),
    TabItem.account: TabItemData(title: 'Account', icon: Icons.person),
  };
}