import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget horizontalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: this,
  );
  Widget verticalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: this,
  );
  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);
  Widget onlyPadding({
    double topPadding = 0,
    double bottomPadding = 0,
    double rightPadding = 0,
    double leftPadding = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      bottom: bottomPadding,
      left: leftPadding,
      right: rightPadding,
      top: topPadding,
    ),
    child: this,
  );
  Widget center() => Center(child: this);

  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius, child: this);
}
