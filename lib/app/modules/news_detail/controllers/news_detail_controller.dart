import 'package:altshue/app/modules/news_detail/models/news_detail.dart';
import 'package:altshue/app/modules/news_detail/providers/news_detai_provider.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController
    with StateMixin<List<DataNewsDetail>> {
  void getNewsDetail() {
    NewsDetailProvider()
        .newsDetail(idNews: Get.arguments['id'])
        .then((response) {
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
}
