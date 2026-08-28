import 'package:fast_app/All_Project/TaskManeger/data/auth_controller/auth_controller.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/user_model.dart';
import 'package:fast_app/All_Project/TaskManeger/data/service/api_caller.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/Custom_snakber.dart';
import 'package:fast_app/All_Project/TaskManeger/util/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoding = false;

  void setLoding(bool value) {
    isLoding = value;
    notifyListeners();
  }

  String? errorMessage;

//////Amer code  idea //////
  Future<bool> logIn_AmerCode(
    BuildContext context,
    String email,
    String password,
  ) async {
    setLoding(true);

    final ApiResponse response = await ApiCaller().postRequest(
      url: TMUrls.LoginURL,

      body: {'email': email, 'password': password},
    );
    setLoding(false);

    if (response.isSuccess == true) {
      UserModel userModel = UserModel.fromJson(response.responseData['data']);
      String token = response.responseData['token'];
      AuthController.saveUserData(userModel, token);

      /*amre akne builder context  baboher kore kaj
      korte pari but jokon multi kaj kor korbo tokon kaj kore na
       ba reuese korer jonno Snakber and navigator bad dite hobe*/
      SnackBarMeassage(context, message: 'Login Success.....!');
      Navigator.pushReplacementNamed(context, '/HomeScreen');
      return true;
    } else {
      // SnackBarMeassageError(context, message:response.responseData.toString());  or
      SnackBarMeassageError(context, message:'Login error.......!');
      return false;
    }
  }
  ///////////////////////////////////////////////////////
  //////////////////////////////////////////////////////

  Future<bool>lohIn(String email,String password)async{
    setLoding(true);
    final ApiResponse response= await ApiCaller().postRequest(url: TMUrls.LoginURL,body:{
      'email':email,
      'password':password,
    });
    setLoding(false);
    if(response.isSuccess){
      final userModel=UserModel.fromJson(response.responseData['data']);
      final token=response.responseData['token'];
      AuthController.saveUserData(userModel, token);
      return true;
    }else{
      return false;
    }
  }

  Future<void> signUp(
      String email,
      String name,
      String lastName,
      String phone,
      String password,
      BuildContext context,

      ) async {
    setLoding(true);
    final ApiResponse response = await ApiCaller().postRequest(
      url: TMUrls.SignupURL,

      body: {
        'email': email,
        'firstname': name,
        'lastName': lastName,
        'mobile': phone,
        'password': password,

      },
    );
    setLoding(false);
    if (response.isSuccess == true) {

      SnackBarMeassage(context, message: response.responseData['status']['data'].toString());
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    } else {
      SnackBarMeassageError(context, message: response.responseData.toString());
    }
  }






}
