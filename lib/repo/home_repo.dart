import 'package:dartz/dartz.dart';
import 'package:otp_api/model/refersh_token.dart';
import 'package:otp_api/model/send_otp_model.dart';
import 'package:otp_api/model/verify_model.dart';
import 'package:otp_api/utils/api/api_expaction.dart';
import 'package:otp_api/utils/api/api_manager.dart';
import 'package:otp_api/utils/api/failure.dart';

class HomeRepo {
  final ApiManager apiManager = ApiManager();
  Future<Either<Failure, PostModel>> sendOtp(
      {required Map data, required int groupId}) async {
    try {
      data['groupId'] = groupId;
      var rsponse = await apiManager.post(
          'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp',
          data);
      var json = PostModel.fromJson(rsponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, VerifyModel>> verifyotp({required Map data}) async {
    try {
      var jsonResponse = await apiManager.post(
          'https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/auth/validateOtp/',
          data);
      var json = VerifyModel.fromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, RefershTokenModel>> refreshToken(
      {required Map data}) async {
    try {
      var jsonResponse = await apiManager.post(
          'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com//authgw/refresh-token',
          data);
      var json = refershTokenModelFromJson(jsonResponse);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
