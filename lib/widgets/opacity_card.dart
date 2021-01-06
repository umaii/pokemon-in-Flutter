import 'package:flutter/material.dart';

class OpacityCard extends StatelessWidget {
  final Widget child;

  const OpacityCard({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      builder: (BuildContext context, double value, Widget child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
