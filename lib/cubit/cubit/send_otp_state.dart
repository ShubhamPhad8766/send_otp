// ignore_for_file: must_be_immutable

part of 'send_otp_cubit.dart';

@immutable
sealed class SendOtpState {}

final class SendOtpInitial extends SendOtpState {}

class SendOtpLoading extends SendOtpState {}

class SendOtpSuccess extends SendOtpState {}

class SendOtpError extends SendOtpState {
  final String? errorMessage;
  SendOtpError(this.errorMessage);
}

class VerifyInital extends SendOtpState {}

class VerifyLoading extends SendOtpState {}

class VerifySuccess extends SendOtpState {}

class VerifyError extends SendOtpState {
  final String? errorMesage;
  VerifyError(this.errorMesage);
}

class VerifyOtpUserExists extends SendOtpState {}

class VerifyOtpUserNotExists extends SendOtpState {
  final String? phoneNumber;
  VerifyOtpUserNotExists(this.phoneNumber);
}

class CustomerInfoLoading extends SendOtpState {}

class CustomerInSuccess extends SendOtpState {}

class CustomerInfoError extends SendOtpState {
  final String? errorMasage;
  CustomerInfoError(this.errorMasage);
}

class UserLoggedIn extends SendOtpState {
  UserLoggedIn();
}

class UserLoggedOut extends SendOtpState {}
