import 'package:voynich_mobile/app/login/email_sign_in_form.dart';
import 'package:voynich_mobile/widgets/buttons/social_sign_in_button.dart';
import 'package:voynich_mobile/widgets/dialogs/platform_exception_alert_dialog.dart';
import 'package:voynich_mobile/app/login/sign_in_bloc.dart';
import 'package:voynich_mobile/models/user.dart';
import 'package:voynich_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({
    @required this.auth,
    @required this.manager,
    @required this.isLoading,
    Key key,
  }) : super (key: key);

  final SignInManager manager;
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = (false);
      rethrow;
    }
  }

  Future<User> signInAnonymously() async => await _signIn(auth.signInAnonymously);
  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);
  Future<User> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);


  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => new ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
      builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
            child: Consumer<SignInManager>(
            builder: (context, manager, _) => SignInPage(
                manager: manager,
                isLoading: isLoading
            ),
          ),
        ),
      ),
    );
  }

    void _showSignInError(BuildContext context, PlatformException exception) {
      PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: exception,
      ).show(context);
    }

    Future<void> _signInWithGoogle(BuildContext context) async {
      try {
        manager.auth.signInWithGoogle();
      } on PlatformException catch (e) {
        // can probably take this to the error handling class as well
        if (e.code != 'ERROR_ABORTED_BY_USER') {
          _showSignInError(context, e);
        }
      }
    }

    Future<void> _signInWithFacebook(BuildContext context) async {
      try {
        manager.auth.signInWithFacebook();
      } on PlatformException catch (e) {
        // can probably take this to the error handling class as well
        if (e.code != 'ERROR_ABORTED_BY_USER') {
          _showSignInError(context, e);
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 37.0),
          child: Column(
            children: <Widget>[
              Image.asset('lib/assets/images/logo.png'),
              EmailSignInForm.create(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SocialSignInButton(
                    assetName: 'lib/assets/images/facebook-logo.png',
                    text: ' Facebook',
                    textColor: Colors.white,
                    color: Color(0xFF334D92),
                    onPressed: isLoading.value ? null : () => _signInWithFacebook(context),
                  ),
                  SocialSignInButton(
                    assetName: 'lib/assets/images/google-logo.png',
                    text: ' Google',
                    textColor: Colors.black87,
                    color: Colors.white,
                    onPressed: isLoading.value ? null : () => _signInWithGoogle(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





