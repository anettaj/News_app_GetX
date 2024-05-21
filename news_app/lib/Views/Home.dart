import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/HomeController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: GetBuilder<HomeController>(
       init: HomeController(),
          builder: (controller){
            if(controller.newsApi !=null) {
              return ListView.builder(
                itemCount: controller.newsApi!.articles.length,
                itemBuilder: (context, index) => SizedBox(
                height: 250,
                  child: Card(
                    child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: Image(
                              image: NetworkImage(
                                  controller.newsApi!.articles[index].urlToImage.toString()
                              ),
                            fit: BoxFit.fill,
                            height: double.infinity,
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(controller.newsApi!.articles[index].author.toString()),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(controller.newsApi!.articles[index].title.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(controller.newsApi!.articles[index].description.toString(),
                                maxLines: 2,)
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),

            );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

    );
  }
}
