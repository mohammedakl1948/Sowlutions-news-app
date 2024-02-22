import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/api/news_service.dart';
import '../../app/data/news_article_model.dart';
import '../../app/modules/home-page/controllers/home_page_controller.dart';
class NewsListView extends StatelessWidget {
  final HomePageController controller;

  NewsListView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: controller.query,
            decoration: InputDecoration(
              hintText: 'Search news...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  controller.query.clear();
                },
              ),
            ),
            onChanged: (value) async {
              await controller.fetchArticles();
            },
          ),
        ),
        Expanded(
          child: Obx(
                () {
              if (controller.articles.isEmpty) {
                return Center(
                  child: Text('No news available'),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.articles.length,
                  itemBuilder: (context, index) {
                    final NewsArticle article = controller.articles[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(article.title ?? ''),
                        subtitle: Text(article.description ?? ''),
                        onTap: () {
                          // Handle onTap event
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}