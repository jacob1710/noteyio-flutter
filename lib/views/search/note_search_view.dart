import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/views/note_viewing/notes_view.dart';
import 'package:noteyio/views/search/note_search_view_model.dart';
import 'package:noteyio/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

class NoteSearchView extends StatefulWidget {
  final String searchTerm;

  const NoteSearchView({Key? key, required this.searchTerm}) : super(key: key);

  @override
  _NoteSearchViewState createState() => _NoteSearchViewState();
}

class _NoteSearchViewState extends State<NoteSearchView> {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteSearchViewModel>.reactive(
        viewModelBuilder: () => NoteSearchViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppStyles.kDefaultDarkColor,
          appBar: AppBar(
            title: Text(
              "Search: "+widget.searchTerm,
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
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _controller,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder(
                        future: model.noteService.searchForNotes(
                            query: widget.searchTerm,
                            userId: model.userService.getUser().id,
                            apiService: model.apiService),
                        builder: (
                            BuildContext context,
                            AsyncSnapshot<UserNoteList?> snapshot,
                            ) {
                          if (snapshot.hasData) {
                            model.userNoteList = snapshot.data!;
                            if (model.userNoteList != null) {
                              // If there was a problem retrieving orders ... (returned null)
                              if (model.userNoteList!.notes.length == 0) {
                                return Center(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                          "No Notes from search: Try adding one"
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return NotesView(
                                  userNotes: model.userNoteList!,
                                  callback:(){
                                    setState(() {

                                    });
                                  } ,
                                );
                              }
                            } else {
                              return Center(
                                  child: Text("No Notes from search: Try adding one")
                              );
                            }
                          } else {
                            return LoadingWidget();
                          }
                        }),
                  ],
                ),
              ),
              // body: Center(child: Text(widget.searchTerm)),
            )
    );
  }
}
