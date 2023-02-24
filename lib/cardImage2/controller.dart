import 'package:http/http.dart' as http;

import 'model.dart';

class CardImageController {
  static const String apiUrl = "http://13.231.0.197/dev/api/v1/cards";

  static Future<CardImageModel> getCardImage() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return cardImageModelFromJson(response.body);
    } else {
      throw Exception("Failed to load card image");
    }
  }
}
