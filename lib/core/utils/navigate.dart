import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void nextScreen(
    Widget screen, {
    bool replacement = false,
    bool removeAll = false,
  }) {
    if (!mounted) return;

    if (removeAll) {
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
      return;
    }

    if (replacement) {
      Navigator.of(
        this,
      ).pushReplacement(MaterialPageRoute(builder: (_) => screen));
      return;
    }

    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }
}
