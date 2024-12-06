import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/presentation/on_board/widgets/on_board_page_view.dart';
import 'core/di/injection.dart';
import 'core/ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(ScreenUtilInit(
    designSize: const Size(428, 810),
    builder: (BuildContext context, Widget? child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThemeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: PageViewExample()),
    );
  }
}
