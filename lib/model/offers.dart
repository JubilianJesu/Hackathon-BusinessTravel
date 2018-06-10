import 'package:meta/meta.dart';

class offers {
  offers({
    @required this.images,
  });

  List<image> images;
}
class image {
  image({
    @required this.title,
    @required this.imageUrl,
    @required this.url,
    @required this.description
  });

  String title;
  String imageUrl;
  String url;
  String category;
  String description;
  String id;

  factory image.fromJson(Map<String, dynamic> json) {
    return new image(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      url: json['url'] as String,      
      description: json['description'] as String,
    );
  }
}