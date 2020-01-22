
import 'package:voynich_mobile/models/user.dart';
import 'package:voynich_mobile/app/home_page.dart';
import 'package:voynich_mobile/app/login/sign_in_form.dart';
import 'package:voynich_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // after logging in, set user uid as public var in the auth class
            User user = snapshot.data;
            auth.loggedInUser = user;

            if (user == null) {
              return SignInPage.create(context);
            }

            return HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
