import 'package:altshue/app/modules/news/models/news.dart';
import 'package:altshue/app/modules/news/providers/news_provider.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with StateMixin<List<DataNews>> {
  void getNews() {
    NewsProvider().news().then((response) {
      if (response.status == 200) {
        if (response.data.isNotEmpty) {
          change(response.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error(response.message));
        // showToasts(text: 'text');
      }
    });
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }
}
