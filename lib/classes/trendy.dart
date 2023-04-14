class Trendy {
  final String title;
  final String descr;
  final String imageUrl;

  Trendy({required this.title, required this.descr, required this.imageUrl});

  factory Trendy.fromJson(Map<String, dynamic> json) {
    return Trendy(
      title: json['title'],
      descr: json['description'],
      imageUrl: json['urlToImage'],
    );
  }
}
