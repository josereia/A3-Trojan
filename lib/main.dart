import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:calculator/app_builder.dart';
import 'package:calculator/routes/app_pages.dart';
import 'package:calculator/routes/app_routes.dart';
import 'package:calculator/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Window.initialize();
  await Window.setEffect(effect: WindowEffect.acrylic);

  runApp(const MyApp());

  doWhenWindowReady(() {
    const size = Size(320, 540);
    appWindow.minSize = size;
    //appWindow.maxSize = size;
    appWindow.size = size;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Calculator",
      theme: AppTheme.getTheme(isDark: false),
      darkTheme: AppTheme.getTheme(isDark: true),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) => AppBuilder(
        child: child,
      ),
    );
  }
}
