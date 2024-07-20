import 'package:dartz/dartz.dart';
import 'package:tv_maze_app/src/core/errors/failure.dart';

typedef Result<E> = Either<Failure, E>;
