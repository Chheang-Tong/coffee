import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';

class MenuViewModel extends GetxController {
  final ProductRepository _repo;
  MenuViewModel(this._repo);

  final items = <Product>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    isLoading.value = true;
    try {
      items.assignAll(await _repo.fetchMenu());
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
