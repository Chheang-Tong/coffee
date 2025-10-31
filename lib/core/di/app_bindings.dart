import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../network/dio_client.dart';
import '../../data/repositories/product_repository.dart';
import '../../features/menu/menu_viewmodel.dart';
import '../../features/cart/cart_viewmodel.dart';
import '../../features/auth/auth_viewmodel.dart';

class AppBindings extends Bindings {
  static Future<void> initStorages() async {
    await GetStorage.init('cavosh');
  }

  @override
  void dependencies() {
    // Core
    Get.lazyPut(() => DioClient(), fenix: true);
    Get.lazyPut(() => ProductRepository(Get.find<DioClient>()), fenix: true);

    // ViewModels (Controllers in GetX)
    Get.lazyPut(() => MenuViewModel(Get.find<ProductRepository>()), fenix: true);
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => AuthViewModel(), fenix: true);
  }
}
