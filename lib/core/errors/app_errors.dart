import 'package:flutter/material.dart';

class AppError {
  static const String _wrongPasswordKey = "wrong-password";
  static const String _tooManyRequestsKey = "too-many-requests";

//TODO EDIT APP ERRORS

  final String? descriptionKey;
  final Exception? exception;

  AppError({this.descriptionKey, this.exception});

  factory AppError.defaultError() {
    return AppError();
  }

  factory AppError.fromException({required dynamic error}) {
    if (error is Error) {
      return AppError.defaultError();
    } else {
      return AppError(exception: error);
    }
  }

  factory AppError.wrongPassword() {
    return AppError(descriptionKey: _wrongPasswordKey);
  }

  factory AppError.tooManyRequests() {
    return AppError(descriptionKey: _tooManyRequestsKey);
  }

  bool get isDefaultError => descriptionKey == null;

  String errorDescription({required BuildContext context}) {
    if (descriptionKey == null) {
      return "Something wrong happened. Please try again later.";
    }

    if (descriptionKey == _wrongPasswordKey) {
      return "The password you entered is incorrect.";
    }

    if (descriptionKey == _tooManyRequestsKey) {
      return "Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.";
    }

    return "Something wrong happened. Please try again later.";
  }
}
