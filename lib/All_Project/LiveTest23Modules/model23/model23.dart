class Todo23 {
  final String id;
  final String title;
  final String description;
  bool isCompleted;

  Todo23({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory Todo23.fromJson(Map<String, dynamic> json) {
    return Todo23(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}