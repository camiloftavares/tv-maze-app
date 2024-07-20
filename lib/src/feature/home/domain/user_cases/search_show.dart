import 'package:tv_maze_app/src/core/types/signatures.dart';
import 'package:tv_maze_app/src/feature/home/domain/repositories/shows_repository.dart';
import 'package:tv_maze_app/src/feature/home/domain/user_cases/search_shows_use_case.dart';

class SearchShow implements SearchShowUseCase {

  SearchShow(
    this._showsRepository,
  );

  final ShowsRepository _showsRepository;
  
  @override
  Future<SearchShowsResult> call({
    required String query
  }) async {
    return _showsRepository.getShowsByQuery(query: query);
  }
}
