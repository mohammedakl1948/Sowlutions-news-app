import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../global/constants.dart';
import '../data/news_article_model.dart';

Future<List<NewsArticle>> fetchNewsArticles({required String query , required String max , required String titleOrAuthor}) async {
  try{
    final url = '${apiUrl}search?q=${query}&apikey=${apiKey}&max=${max}&in=${titleOrAuthor}';

    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];

      return articles.map((article) {
        return NewsArticle(
          title: article['title'],
          description: article['description'],
          content: article['content'],
          url: article['url'],
          imageUrl: article['image'],
          publishedAt: DateTime.parse(article['publishedAt']),
          sourceName: article['source']['name'],
          sourceUrl: article['source']['url'],
        );
      }).toList();
    } else {
      return [];
    }
  }catch(e){
    print(e.toString());
    return [];
  }
}