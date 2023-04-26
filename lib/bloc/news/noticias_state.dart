part of 'noticias_bloc.dart';

@immutable
abstract class NoticiasState {
  final bool existeNoticias;
  final List<Article> noticias;

  List<CategoryIcon> _categories = [
    CategoryIcon(FontAwesomeIcons.building, 'business'),
    CategoryIcon(FontAwesomeIcons.tv, 'entertainment'),
    CategoryIcon(FontAwesomeIcons.addressCard, 'general'),
    CategoryIcon(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryIcon(FontAwesomeIcons.vials, 'science'),
    CategoryIcon(FontAwesomeIcons.volleyballBall, 'sports'),
    CategoryIcon(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> _categoryNoticias = {};

  Map<String, List<Article>> get getCategoryNoticias => _categoryNoticias;
  //inicializa categoriasNoticias en el constructor con las categorias
  NoticiasState({this.existeNoticias = false, this.noticias = const []}) {
    cargarCategoryNoticiasByKey();
  }

  cargarCategoryNoticiasByKey() {
    _categories.forEach((element) {
      _categoryNoticias[element.name] = [];
    });
  }

  get getCategories => _categories;
}

class NoticiasInitialState extends NoticiasState {
  NoticiasInitialState() : super(existeNoticias: false, noticias: const []);
}

class NoticiasLoadingState extends NoticiasState {
  final List<Article> noticias;

  NoticiasLoadingState({this.noticias = const []})
      : super(
          existeNoticias: true,
          noticias: noticias,
        );
}

class NoticiasLoadingCategoriesState extends NoticiasState {
  final List<Article> noticias;
  final String category;
  NoticiasLoadingCategoriesState({this.noticias = const [], this.category = ''})
      : super(existeNoticias: true, noticias: noticias) {
    cargarCategoryNoticiasByValue(noticias);
  }

  cargarCategoryNoticiasByValue(List<Article> noticias,
      {String nameCategory = ''}) {
    _categories.forEach((element) {
      _categoryNoticias[category] = noticias;
    });
  }
}

class NoticiasError extends NoticiasState {
  final String message;
  NoticiasError({required this.message})
      : super(existeNoticias: false, noticias: const []);
}
