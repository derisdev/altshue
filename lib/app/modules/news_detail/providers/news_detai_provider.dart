import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/news_detail/models/news_detail.dart';
import 'package:get/get.dart';

class NewsDetailProvider extends GetConnect {
  Future<NewsDetail> newsDetail({required String idNews}) async {
    final response = await get(ApiPath.newsDetail + '?id=$idNews');
    print(response.body);
    return NewsDetail.fromJson(response.body);
  }
}
