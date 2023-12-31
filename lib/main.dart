import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:window_size/window_size.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:io' show Platform;

const Color darkBlue = Color.fromARGB((255), 18, 32, 47);

void main() {
  setHashUrlStrategy();
  setupWindow();
  runApp(const Bookstore());
}

const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {
  if(!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Navigation and routing');
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    setWindowMinSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
        setWindowFrame(Rect.fromCenter(
          center: screen!.frame.center,
          width: windowWidth,
          height: windowHeight,
        ));
    });
  }
}