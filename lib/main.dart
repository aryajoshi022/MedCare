import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyBz1bFDqvOmrii2Un8qrJZ31u4Ig5pmBno",
          appId: "1:826881375590:android:992742abc2bb7d1bce1ca7",
          messagingSenderId: "826881375590",
          projectId: "medcare-71f3a",
        ),
      )
      : await Firebase.initializeApp();
  await setOptimalDisplayMode();

  debugPrint("✅ Firebase Initialized Successfully");
  runApp(const App());
}

Future<void> setOptimalDisplayMode() async {
  try {
    final List<DisplayMode> modes = await FlutterDisplayMode.supported;
    if (modes.isNotEmpty) {
      // Log available modes for debugging
      debugPrint('Display Modes Available: ${modes.length}');
      for (final DisplayMode mode in modes) {
        debugPrint('Mode: ${mode.width}x${mode.height} @${mode.refreshRate}Hz');
      }

      // Get saved refresh rate preference
      final prefs = await SharedPreferences.getInstance();
      final int savedRefreshRate = prefs.getInt('refresh_rate') ?? 0;

      if (savedRefreshRate > 0) {
        // Find the closest matching refresh rate
        DisplayMode? targetMode;
        for (final mode in modes) {
          if (mode.refreshRate.round() == savedRefreshRate) {
            targetMode = mode;
            break;
          }
        }

        if (targetMode != null) {
          await FlutterDisplayMode.setPreferredMode(targetMode);
        } else {
          // Fallback to default
          await FlutterDisplayMode.setPreferredMode(modes.first);
        }
      } else {
        // No preference set, use default
        await FlutterDisplayMode.setPreferredMode(modes.first);
      }

      final DisplayMode active = await FlutterDisplayMode.active;
      debugPrint(
        'Active Mode: ${active.width}x${active.height} @${active.refreshRate}Hz',
      );
    } else {
      debugPrint('Display mode adjustment is not supported on this device.');
    }
  } catch (e) {
    debugPrint('Error setting display mode: $e');
  }
}
