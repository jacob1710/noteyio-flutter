import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/views/home/home_view_model.dart';
import 'package:noteyio/views/note_viewing/notes_view.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:noteyio/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController _controller = new ScrollController();

  Future<void> _refreshData(HomeViewModel homeViewModel) async {
    homeViewModel.userNoteList = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppStyles.kDefaultDarkColor,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                print('pressed action button');
                model.navigateToCreateNoteView(() {
                  _refreshData(model);
                });
              },
              child: const Icon(Icons.add),
              backgroundColor: AppStyles.kSecondaryColor,
            ),
            appBar: AppBar(
              title: Text(
                "NoteyIO",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultButton(
                    onTapped: () {
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
            // onRefresh: (){
            //   return _refreshData(model);
            // },
            body: RefreshIndicator(
                onRefresh: () {
                  return _refreshData(model);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder(
                          future: model.noteService.getNotesForUser(
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
                                            "No Notes: Try adding one"
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return NotesView(
                                      userNotes: model.userNoteList!,
                                      callback:(){
                                        _refreshData(model);
                                      } ,
                                  );
                                }
                              } else {
                                return Center(
                                    child: Text("You have no previous orders!"));
                              }
                            } else {
                              return LoadingWidget();
                            }
                          }),
                    ],
                  ),
                ))));
  }
}
