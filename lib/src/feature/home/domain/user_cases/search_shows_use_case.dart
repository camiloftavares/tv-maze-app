import 'package:tv_maze_app/src/core/types/signatures.dart';

abstract class SearchShowUseCase {
  Future<SearchShowsResult> call({
    required String query,
  });
}
