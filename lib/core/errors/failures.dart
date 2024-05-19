/// this class is used to manage the failures
abstract class Failure {
  /// constructor
  const Failure(this.errMessage);

  /// error message
  final String errMessage;
}

/// a failure class for a normal failure
class NormalFailure extends Failure {
  /// constructor
  const NormalFailure(super.errMessage);
}
