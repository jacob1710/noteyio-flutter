import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/views/search/note_search_view_model.dart';
import 'package:stacked/stacked.dart';

class NoteSearchView extends StatefulWidget {
  final String searchTerm;

  const NoteSearchView({Key? key, required this.searchTerm}) : super(key: key);

  @override
  _NoteSearchViewState createState() => _NoteSearchViewState();
}

class _NoteSearchViewState extends State<NoteSearchView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteSearchViewModel>.reactive(
        viewModelBuilder: () => NoteSearchViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppStyles.kDefaultDarkColor,
          appBar: AppBar(
            title: Text(
              "Search",
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
              body: Center(child: Text(widget.searchTerm)),
            )
    );
  }
}
