part of 'noticias_bloc.dart';

@immutable
abstract class NoticiasEvent {}

class GetNewsListEvent extends NoticiasEvent {}

// class NavigateToCategoryEvent extends NoticiasEvent {
//   final String category;
//   NavigateToCategoryEvent({required this.category});
// }

class NoticiasLoadingCategoriesEvent extends NoticiasEvent {
  final String category;
  final List<Article> noticias;
  NoticiasLoadingCategoriesEvent(
      {required this.category, this.noticias = const []});
}
