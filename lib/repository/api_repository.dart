import 'package:bloc_peticiones_noticias/model/news_model.dart';
import 'package:bloc_peticiones_noticias/services/api_news_repository.dart';

class ApiRepository {
  final _provider = ApiNoticias();
  Future<List<Article>> getTopHeadlines() => _provider.getTopHeadlines();

  Future<List<Article>> getCategoryArticles(String category) =>
      _provider.getCategoryArticles(category);
}

class NetWoerError extends Error {}
