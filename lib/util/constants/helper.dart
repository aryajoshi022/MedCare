import 'package:flutter/material.dart';

class AppHelper {
  AppHelper._();

  /// Function to wrap a widget with Expanded in portrait mode
  static Widget wrapWithExpanded(BuildContext context, Widget child,) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? Expanded(child: child) : child;
  }
  /// Function to wrap a widget with SingleChildScrollView in landscape mode
  static Widget wrapWithSingleChildScrollView(BuildContext context, Widget child) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape ? SingleChildScrollView(child: child) : child;
  }

}
