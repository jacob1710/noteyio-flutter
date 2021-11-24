import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/app_styles.dart';
import 'package:noteyio_flutter/models/User.dart';
import 'package:noteyio_flutter/views/authentication/registration/registration_view_model.dart';
import 'package:noteyio_flutter/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
        viewModelBuilder: () => RegistrationViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) =>  Scaffold(
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
                        "Register:",
                        style: AppStyles.kHeadingTextStyle,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.perm_identity),
                          hintText: 'Enter Username',
                          labelText: 'Username:',
                        ),
                        keyboardType: TextInputType.text,
                        enableSuggestions: true,
                        autocorrect: false,
                        onChanged: (value){
                          print(value);
                          model.currentUserName = value;
                        },
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
                          onTapped: () async{
                            User? user = await model.registerPressed();
                          },
                          text: 'Register',
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
