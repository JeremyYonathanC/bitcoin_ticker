import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Networking {
  String? api;

  Networking({this.api});

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse(api!),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
