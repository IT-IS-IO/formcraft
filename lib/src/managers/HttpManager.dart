
import 'package:http/http.dart' as http;

class HttpManager {


  static post({ required String url, required Map<String, dynamic> data, required Function callback }) async {

    try {

      final response = await http.post(Uri.parse(url), body: data);

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load post');

      }

    } catch (e) {

      print(e);

    }

  }


  static get({ required String url, required Function callback }) async {

    try {

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load get');

      }

    } catch (e) {

      print(e);

    }

  }


  static put({ required String url, required Map<String, dynamic> data, required Function callback }) async {

    try {

      final response = await http.put(Uri.parse(url), body: data);

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load put');

      }

    } catch (e) {

      print(e);

    }

  }


  static delete({ required String url, required Function callback }) async {

    try {

      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load delete');

      }

    } catch (e) {

      print(e);

    }

  }


  static patch({ required String url, required Map<String, dynamic> data, required Function callback }) async {

    try {

      final response = await http.patch(Uri.parse(url), body: data);

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load patch');

      }

    } catch (e) {

      print(e);

    }

  }


  static head({ required String url, required Function callback }) async {

    try {

      final response = await http.head(Uri.parse(url));

      if (response.statusCode == 200) {

        callback(response.body);

      }
      else {

        throw Exception('Failed to load head');

      }

    } catch (e) {

      print(e);

    }

  }


  static final HttpManager _instance = HttpManager._internal();

  factory HttpManager() => _instance;

  HttpManager._internal();

  static HttpManager get getInstance => _instance;

}