import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/authentication/login/login_view_model.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppStyles.kDefaultDarkColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Login:",
                            style: AppStyles.kHeadingTextStyle,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.perm_identity),
                              hintText: 'Enter Email',
                              labelText: 'Email Address:',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            enableSuggestions: true,
                            autocorrect: false,
                            onChanged: (value) {
                              model.currentEmail = value;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Enter Password',
                              labelText: 'Password:',
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            onChanged: (value) {
                              model.currentPwd = value;
                            },
                          ),
                          Center(
                            child: DefaultButton(
                              onTapped: () async {
                                NoteyioUser? optionalUser = await model.loginPressed();
                                if(optionalUser!=null) {
                                  print("found user from api");
                                  model.userService.setUser(user:optionalUser);
                                  model.navigateToHome();
                                }else{
                                  print("null user from api");
                                  //Error - display error
                                  model.showErrorDialog(context, "Error", "Error logging in, please try again");
                                }
                              },
                              text: 'Login',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
