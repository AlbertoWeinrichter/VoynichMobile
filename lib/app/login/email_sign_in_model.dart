
import 'package:voynich_mobile/utils/validators.dart';

enum EmailSignInFormType { signIn, register}

// the word model is misleading here
// this is not a database object definition
// this is the state instance of the email sign in form
// also, we bring the validators as a mixin
class EmailSignInModel with EmailAndPasswordvalidators{
  EmailSignInModel({
    this.email = '',
    this.password = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false
  });

  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  String get primaryButtonText{
    return formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
  }

  // disable submit button until form validation passes
  bool get canSubmit {
    return emailValidator.isValid(email)
           && passwordValidator.isValid(password)
           && !isLoading;
  }

  // these getters make use of the validators
  String get passwordErrorText {
    bool showErrorText = submitted && passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }
  String get emailErrorText {
    bool showErrorText = submitted && emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }



  EmailSignInModel copyWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}