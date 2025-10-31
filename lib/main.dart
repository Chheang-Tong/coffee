import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/di/app_bindings.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBindings.initStorages();
  runApp(const CavoshApp());
}

class CavoshApp extends StatelessWidget {
  const CavoshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cavosh',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      initialBinding: AppBindings(),
      theme: AppTheme.light,
    );
  }
}
