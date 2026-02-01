import 'package:flutter/material.dart';

Route<T> pushPage<T>(BuildContext context, Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(begin: Offset(0.0, 0.06), end: Offset.zero).chain(CurveTween(curve: Curves.easeOutCubic));
      final fade = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn));
      return SlideTransition(position: animation.drive(tween), child: FadeTransition(opacity: animation.drive(fade), child: child));
    },
    transitionDuration: Duration(milliseconds: 420),
  );
}
