class Attraction {
  final int id;
  final String title;
  final String country;
  final String address;
  final String description;
  final List<String> images;
  final String? video;
  final double latitude;
  final double longitude;
  bool isFavourite;

  Attraction(
      {required this.id,
      required this.title,
      required this.country,
      required this.address,
      required this.description,
      required this.images,
      this.video,
      required this.latitude,
      required this.longitude,
      required this.isFavourite});

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        id: json['id'],
        title: json['title'],
        country: json['country'],
        address: json['address'],
        description: json['description'],
        images: List<String>.from(json['images']),
        video: json['video'] == null ? null : (json['video']),
        latitude: json['coordinates']['lat'],
        longitude: json['coordinates']['lon'],
        isFavourite: json['isFavourite'],
      );
}
