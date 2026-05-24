
/// String ///
extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || (this?.trim().isEmpty??true);
}

/// List ////
extension ListExtension<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
