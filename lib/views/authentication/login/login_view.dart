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
            children: [
              TextFormField(

              ),
              TextFormField(

              ),
              Center(
                child: DefaultButton(
                  onTapped: (){},
                  text: 'Login',
                ),
              ),
            ],
          ),
        )
    );
  }
}
