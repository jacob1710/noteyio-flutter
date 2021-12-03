import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/views/home/home_view_model.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppStyles.kDefaultDarkColor,
          appBar: AppBar(
            title: Text("NoteyIO",style: TextStyle(color: Colors.white),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(
                    onTapped: (){
                      print("logout pressed");
                      model.logoutUser();
                      },
                    text: "Logout",
                  buttonColor: AppStyles.kSecondaryColor,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
          body: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                Text(
                  model.userService.getUser().email
                ),
              ),
            ),
          ),
        ));
  }
}
