import 'package:flutter/material.dart';

class CenteredContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  const CenteredContainer({Key? key, required this.child, this.maxWidth = 860}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth < maxWidth ? constraints.maxWidth * 0.95 : maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: child,
          ),
        );
      },
    );
  }
}
