import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/models/Note.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

import 'individual_note_view_model.dart';

class IndividualNoteView extends StatefulWidget {
  final Note note;
  const IndividualNoteView({Key? key, required this.note}) : super(key: key);

  @override
  _IndividualNoteViewState createState() => _IndividualNoteViewState();
}

class _IndividualNoteViewState extends State<IndividualNoteView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualNoteViewModel>.reactive(
        viewModelBuilder: () => IndividualNoteViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppStyles.kDefaultDarkColor,
              appBar: AppBar(
                title: Text(
                  widget.note.title,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: DefaultButton(
                  //     onTapped: () {
                  //       print("logout pressed");
                  //       model.logoutUser();
                  //     },
                  //     text: "Logout",
                  //     buttonColor: AppStyles.kSecondaryColor,
                  //     textColor: Colors.white,
                  //   ),
                  // )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(widget.note.imgId!='')
                    Card(
                      child: Image.network(
                          model.imageApiEndpoint+widget.note.imgId,
                          headers: model.headers,
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Text:",
                              style: AppStyles.kHeadingTextStyle,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(widget.note.text),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Tags:",
                            style: AppStyles.kHeadingTextStyle,
                          ),
                          Column(
                            children: [
                              for ( var i in (widget.note.tags)) Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    "• "+i.toString()
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
