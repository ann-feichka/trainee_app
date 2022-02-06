import 'package:flutter/material.dart';

class InheritedSelector extends InheritedWidget {
  final int? id;
  final Widget child;

  InheritedSelector({Key? key, required this.id, required this.child})
      : super(key: key, child: child);

  static int? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedSelector>()?.id;

  @override
  bool updateShouldNotify(InheritedSelector oldWidget) {
    return oldWidget.id != id;
  }
}
