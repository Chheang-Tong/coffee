import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthViewModel extends GetxController {
  final box = GetStorage('cavosh');

  final email = ''.obs;
  final password = ''.obs;
  final isBusy = false.obs;
  final error = RxnString();

  Future<bool> login() async {
    isBusy.value = true;
    await Future.delayed(const Duration(milliseconds: 700));
    isBusy.value = false;
    if (email.value.isNotEmpty && password.value.length >= 4) {
      box.write('token', 'mock-token');
      return true;
    } else {
      error.value = 'Invalid credentials';
      return false;
    }
  }

  bool get isLoggedIn => box.hasData('token');
}
