extension MapEXT on Map<String, dynamic> {
  Map<String, dynamic> withoutNulls() {
    return Map.fromEntries(
      entries.where((e) => e.value != null),
    );
  }
}

extension MapDynamicEXT on Map{
  Map<String,dynamic> get deepCast{
    return map((key, value) {
      if (value is Map) return MapEntry(key.toString(), value.deepCast);
      if (value is List) return MapEntry(key.toString(), value.map((e) => e is Map ? e.deepCast : e).toList());
      return MapEntry(key.toString(), value);
    });
  }

}
