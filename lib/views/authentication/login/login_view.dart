import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/app_styles.dart';
import 'package:noteyio_flutter/views/authentication/login/login_view_model.dart';
import 'package:noteyio_flutter/widgets/default_button.dart';
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
                      TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                          hintText: 'Enter Email',
                          labelText: 'Email Address:',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        enableSuggestions: true,
                        autocorrect: false,
                        onChanged: (value){
                          print(value);
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
                        onChanged: (value){
                          print(value);
                          model.currentPwd = value;
                        },
                      ),
                      Center(
                        child: DefaultButton(
                          onTapped: (){
                            model.loginPressed();
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
        )
    );
  }
}
