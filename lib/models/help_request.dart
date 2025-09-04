class HelpRequest {
  final int? id;
  final String title;
  final String category;
  final String details;
  final bool offered;

  HelpRequest({
    this.id,
    required this.title,
    required this.category,
    required this.details,
    this.offered = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'details': details,
      'offered': offered ? 1 : 0,
    };
  }

  factory HelpRequest.fromMap(Map<String, dynamic> map) {
    return HelpRequest(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      details: map['details'],
      offered: map['offered'] == 1,
    );
  }
}
