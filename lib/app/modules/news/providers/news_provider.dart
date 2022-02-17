import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/news/models/news.dart';
import 'package:get/get.dart';

class NewsProvider extends GetConnect {
  Future<News> news() async {
    final response = await get(ApiPath.news);
    print(response.body);
    return News.fromJson(response.body);
  }
}
