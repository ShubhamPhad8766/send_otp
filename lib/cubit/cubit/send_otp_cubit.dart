// ignore_for_file: depend_on_referenced_packages, unnecessary_import, avoid_print, unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:otp_api/preferance/preferance.dart';
import 'package:otp_api/repo/home_repo.dart';
import 'package:otp_api/utils/snakbar/snakbar.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  SendOtpCubit() : super(SendOtpInitial());
  final HomeRepo homeRepo = HomeRepo();
  void sendotp(int number, BuildContext context) async {
    var data = {"phoneNumber": number};
    try {
      emit(SendOtpLoading());
      var response = await homeRepo.sendOtp(data: data, groupId: 1703228300417);
      response.fold((error) {
        emit(SendOtpError(error.message));
        print(response);
        print(state);
        print(data);
        print(number);
      }, (data) {
        emit(SendOtpSuccess());
        SnackBarWidget.showSnackbar(context, "Otp Send Successfully!");
      });
    } catch (e) {
      emit(SendOtpError(e.toString()));
    }
  }

  void verifyOtp({
    required String? phoneNumber,
    int? otp,
  }) async {
    var data = {"phoneNumber": phoneNumber, "otp": otp};
    emit(VerifyLoading());
    var response = await homeRepo.verifyotp(data: data);
    response.fold((error) {
      emit(VerifyError(error.message));
      print(data);
      print(state);
      print(phoneNumber);
    }, (data) {
      emit(VerifySuccess());
      if (data.data?.userExists != true) {
        emit(VerifyOtpUserNotExists(phoneNumber));
      } else {
        updateToken(data.token.toString(), userNotExists: false);
      }
    });
  }

  Future updateToken(String token, {bool? userNotExists}) async {
    var groupId = 1703228300417;
    var data = {"token": token, "groupId": groupId};
    if (userNotExists ?? false) {
      emit(CustomerInfoLoading());
    } else {
      emit(VerifyLoading());
    }
    var response = await homeRepo.refreshToken(data: data);
    response.fold((error) {
      if (userNotExists ?? false) {
        emit(CustomerInfoError(error.message));
      } else {
        emit(VerifyError(error.toString()));
      }
    }, (data) async {
      if (userNotExists ?? false) {
        emit(CustomerInSuccess());
      }
      emit(UserLoggedIn());
      LocalStorageUtils.fetchToken();
    });
  }

  void signOut(BuildContext context) async {
    emit(UserLoggedOut());
    await LocalStorageUtils.clear();
    // log(await LocalStorageUtils.fetchToken() ?? "");
  }
}
