

import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

import 'intro_view_model.dart';

class IntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.reactive(
        viewModelBuilder: () => IntroViewModel(),
        onModelReady: (model) => model.init(context: context),
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppStyles.kDefaultDarkColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(),
              // // Hero(
              // //   tag: 'logoAnimation',
              // //   child: Image.asset(
              // //     'assets/images/training_logo.png',
              // //     fit: BoxFit.cover,
              // //   ),
              // // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    onTapped: () {
                      model.getStarted();
                      model.navigateToLogin();
                    },
                    text: "I Already have an account",
                  ),
                ],
              ),
              SizedBox(height: 50,),
              DefaultButton(
                onTapped: () {
                  model.getStarted();
                  // model.navigateToLogin();
                  print('Register');
                  model.navigateToRegistration();
                  },
                text: "Create a new Account",
              ),
            ],
          ),
        )
    );
  }
}