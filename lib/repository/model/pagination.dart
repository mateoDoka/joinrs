class Pagination<T> {
  final int total;
  final List<T> items;

  factory Pagination.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    final total = json['total'] as int;
    final items = (json['list'] as List<dynamic>)
        .map((e) => fromJson(e as Map<String, dynamic>))
        .toList();
    return Pagination(
      total: total,
      items: items,
    );
  }

  Pagination({
    required this.total,
    required this.items,
  });
}
