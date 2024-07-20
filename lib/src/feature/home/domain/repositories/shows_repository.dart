import 'package:tv_maze_app/src/core/types/signatures.dart';

abstract class ShowsRepository {
  Future<SearchShowsResult> getShowsByQuery({String query});
}
