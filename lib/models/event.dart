class Event {
  final int id;
  final String name;
  final String description;
  final String category;
  final String featuredImage;
  final String location;
  final String time;
  final String date;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.featuredImage,
    required this.location,
    required this.time,
    required this.date,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      featuredImage: json['featured_image'],
      location: json['location'],
      time: json['time'],
      date: json['date'],
    );
  }
}
