import 'package:flutter/material.dart';

class CategoryIcon {
  final IconData icon;
  final String name;

  CategoryIcon(this.icon, this.name);

  IconData get getIcon => this.icon;

  String get getName => this.name;
}
