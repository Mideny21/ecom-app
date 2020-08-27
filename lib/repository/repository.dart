import 'package:http/http.dart' as http;

class Repository {
  String _baseUrl = "http://192.168.43.111:8000/api";

  httpGet(String api) async {
    return await http.get(_baseUrl + "/" + api);
  }

  httpGetById(String api, categoryId) async {
    return await http.get(_baseUrl + "/" + api + "/" + categoryId.toString());
  }
}
