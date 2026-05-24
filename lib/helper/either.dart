sealed class Either<L, R> {
  const Either();

  T fold<T>(
      T Function(L left) onLeft,
      T Function(R right) onRight,
      );
}

final class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(value);
}

final class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(value);
}

/// Equivalent to void — used when Right has no meaningful value
final class Unit {
  const Unit._();
}
Unit unit = Unit._() ;