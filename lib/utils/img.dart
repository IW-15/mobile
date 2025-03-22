import 'package:flutter_dotenv/flutter_dotenv.dart';

String img(String path) {
  return "${dotenv.env['BASE_URL']!}/storage/$path";
}
