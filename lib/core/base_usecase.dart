// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:helper/core/errors/failures.dart';

/// this is the base use case class need [<Failure, Type, Parameters>]
abstract class BaseUseCase<Type, Parameters> {
  /// this is the call method for the use case
  Future<Either<Failure, Type>> call(Parameters parameters);
}

/// this is the no parameters class
class NoParameters {}
