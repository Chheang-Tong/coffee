import 'package:get/get.dart';
import '../../features/splash/splash_view.dart';
import '../../features/auth/login_view.dart';
import '../../features/menu/menu_view.dart';
import '../../features/product_detail/product_detail_view.dart';
import '../../features/cart/cart_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.login, page: () => const LoginView()),
    GetPage(name: Routes.menu, page: () => const MenuView()),
    GetPage(name: Routes.productDetail, page: () => const ProductDetailView()),
    GetPage(name: Routes.cart, page: () => const CartView()),
  ];
}
