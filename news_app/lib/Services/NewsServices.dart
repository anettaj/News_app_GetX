import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';

class NewsServices extends GetConnect implements GetxService{
  String Key="6892acc981024817b2391949d79222f7";

  Future<NewsApi> getNewsdata() async{
    var newsData= await get(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-21&sortBy=publishedAt&apiKey=$Key");
    print("News api: ${newsData.body}");
  return NewsApi.fromJson(newsData.body);
  }

}