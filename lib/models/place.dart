class Place {
  final String name;
  final String address;
  final String? photoUrl;

  Place({required this.name, required this.address, this.photoUrl});

  factory Place.fromJson(Map<String, dynamic> json) {
    String? getImageUrl(List<dynamic>? photos) {
      if (photos != null && photos.isNotEmpty) {
        var photo = photos.first;
        return "${photo['prefix']}original${photo['suffix']}";
      }
      return null;
    }

    String address =
        json['location']['formatted_address'] ?? 'Dirección no disponible';

    return Place(
      name: json['name'] ?? 'N/A',
      address: address,
      photoUrl: getImageUrl(json['photos'] as List?),
    );
  }
}
