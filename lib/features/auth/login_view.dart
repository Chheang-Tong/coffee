import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../core/routes/app_routes.dart';
import 'auth_viewmodel.dart';

class LoginView extends GetView<AuthViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthViewModel());
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => controller.email.value = v,
            ),
            const SizedBox(height: 12),
            AppTextField(
              hint: 'Password',
              obscureText: true,
              onChanged: (v) => controller.password.value = v,
            ),
            const SizedBox(height: 16),
            Obx(() => AppButton(
              text: controller.isBusy.value ? 'Signing in...' : 'Login',
              onPressed: controller.isBusy.value ? null : () async {
                final ok = await controller.login();
                if (ok) Get.offAllNamed(Routes.menu);
                if (!ok && controller.error.value != null) {
                  Get.snackbar('Login failed', controller.error.value!);
                }
              },
            )),
            const Spacer(),
            const Text('Or continue with'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(child: Icon(Icons.facebook)),
                SizedBox(width: 12),
                CircleAvatar(child: Icon(Icons.g_mobiledata)),
                SizedBox(width: 12),
                CircleAvatar(child: Icon(Icons.apple)),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
