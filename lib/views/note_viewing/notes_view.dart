import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/views/note_viewing/notes_view_model.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatefulWidget {
  final UserNoteList userNotes;
  final VoidCallback callback;

  const NotesView({Key? key, required this.userNotes, required this.callback}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var padding = MediaQuery.of(context).padding;
    double usableScreenHeight = screenHeight - padding.top - kToolbarHeight;
    return ViewModelBuilder<NotesViewModel>.reactive(
        viewModelBuilder: () => NotesViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => ListView.builder(
            shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemCount: widget.userNotes.notes.length,
              itemBuilder: (context, int index){
              return Slidable(
                //https://pub.dev/packages/flutter_slidable/example
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: null,
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        print('delete pressed for ${widget.userNotes.notes[index].noteId}');
                        bool? success = await model.apiService.deleteNoteWithId(widget.userNotes.notes[index].noteId);
                        widget.callback();
                        },
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    title: Text(widget.userNotes.notes[index].title),
                    tileColor: Colors.white,
                    onTap: () {
                      model.navigateToIndividualNoteView(widget.userNotes.notes[index]);
                    },
                  ),
                ),
              );
                // return Container(
                //   height: usableScreenHeight*0.1,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(widget.userNotes.note_viewing[index].title),
                //     ),
                //   ),
                // );
              }
          )
    );

  }
  void doNothing(BuildContext context) {}

}
