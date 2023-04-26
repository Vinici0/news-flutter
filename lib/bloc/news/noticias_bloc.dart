import 'package:bloc/bloc.dart';
import 'package:bloc_peticiones_noticias/model/catogory_model.dart';
import 'package:bloc_peticiones_noticias/model/news_model.dart';
import 'package:bloc_peticiones_noticias/repository/api_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

part 'noticias_event.dart';
part 'noticias_state.dart';

class NoticiasBloc extends Bloc<NoticiasEvent, NoticiasState> {
  NoticiasBloc() : super(NoticiasInitialState()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetNewsListEvent>((event, emit) async {
      try {
        final List<Article> noticias = await _apiRepository.getTopHeadlines();
        emit(NoticiasLoadingState(noticias: noticias));
      } on NoticiasError catch (e) {
        emit(NoticiasError(message: e.message));
      }
    });

    on<NoticiasLoadingCategoriesEvent>((event, emit) async {
      try {
        final List<Article> noticias =
            await _apiRepository.getCategoryArticles(event.category);
        emit(NoticiasLoadingCategoriesState(
            category: event.category, noticias: noticias));
      } on NoticiasError catch (e) {
        emit(NoticiasError(message: e.message));
      }
    });

    _init();
  }

  Future<void> _init() async {
    try {
      final ApiRepository _apiRepository = ApiRepository();
      final List<Article> noticiasL = await _apiRepository.getTopHeadlines();
      add(GetNewsListEvent());
    } catch (e) {
      // add(NoticiasError(message: e.toString()));
    }
  }
}
