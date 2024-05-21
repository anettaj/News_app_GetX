import 'package:get/get.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:news_app/Services/NewsServices.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  NewsApi? newsApi;
  void getNews() async{
    newsApi= await NewsServices().getNewsdata();
    update();
  }


  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }


}