import 'package:bloc_peticiones_noticias/global/environment.dart';
import 'package:bloc_peticiones_noticias/model/catogory_model.dart';
import 'package:bloc_peticiones_noticias/model/news_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ApiNoticias {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  bool _isLoading = true;

  List<CategoryIcon> categories = [];

  Future<List<Article>> getTopHeadlines() async {
    final url = Uri.parse(Environment.apiUrl);
    final resp = await http.get(url);
    final newsResponse = newsResponseFromMap(resp.body);
    headlines.addAll(newsResponse.articles);
    _isLoading = false;
    return newsResponse.articles;
  }

  //getCategoryArticles
  Future<List<Article>> getCategoryArticles(String category) async {
    final url = Uri.parse('${Environment.apiUrl}&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromMap(resp.body);
    return newsResponse.articles;
  }
}
