import 'package:http/http.dart' as http;

class GetOrderHelper {
  getOrderRequests(String url) async {
    final response = await http.get(Uri.parse(url));

    return response;
    // Return the list of requests
  }
}
