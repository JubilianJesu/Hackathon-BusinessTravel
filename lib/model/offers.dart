import 'package:meta/meta.dart';

class offers {
  offers({
    @required this.images,
  });

  final List<image> images;
}
class image {
  image({
    @required this.title,
    @required this.thumbnail,
    @required this.url,
  });

  final String title;
  final String thumbnail;
  final String url;
}