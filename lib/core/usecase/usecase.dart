import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType, Parms> {
  Future<Either<Failure, SuccessType>> call(Parms parms);
}

class NoParams {}
