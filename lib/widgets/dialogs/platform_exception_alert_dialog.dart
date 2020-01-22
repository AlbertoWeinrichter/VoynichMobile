import 'package:voynich_mobile/widgets/dialogs/platform_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {

  // improve this class making it receive 3 arguments and making it a provider
  // probably the biggest exceptions should be captured in an external service
  // like grafana, for visibility and big scale debugging

  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
      title: title,
      content: _message(exception),
      defaultActionText: 'OK'
  );

  // "?? exception.message" means exception.meeesage value will only be used
  // as fallback if there is no corresponding ERROR_CODE in the _errors Map
  static String _message(PlatformException exception) {
    // we need a custom logic to show firestore permission errors
    if(exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Error 7') {
        return 'Firestore: Missing or insufficient permissions';
      }
    }
    return _errors[exception.message] ?? exception.message;
  }

  static Map<String, String> _errors = {
    // FIREBASE AUTHENTICATION
    'ERROR_WRONG_PASSWORD': 'The password is wrong',
    'ERROR_USER_NOT_FOUND': 'There is no user corresponding to the given email address',
    'ERROR_TOO_MANY_REQUESTS': 'There was too many attempts to sign in as this user. Please wait a couple minutes and try again',
    'ERROR_OPERATION_NOT_ALLOWED': 'Email & Password combination not valid for some reason',
    'ERROR_WEAK_PASSWORD': 'The password is not strong enough',
    'ERROR_INVALID_EMAIL': 'Please insert a valid email address',
    'ERROR_EMAIL_ALREADY_IN_USE': 'This email address is already in use by a different account',
    'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL': 'There already exists an account with the email address asserted by Google',
  };
}
