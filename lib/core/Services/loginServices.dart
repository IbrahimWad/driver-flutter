import 'package:driver/model/loginModel.dart';
import 'package:driver/widget/constant/urls.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Login(UserModel userModel) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: userModel.toJson(),
    );
    return response;
  }
}
