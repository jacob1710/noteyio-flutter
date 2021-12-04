import 'package:flutter/material.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/views/notes/notes_view_model.dart';
import 'package:stacked/stacked.dart';

class NotesView extends StatefulWidget {
  final UserNoteList userNotes;

  const NotesView({Key? key, required this.userNotes}) : super(key: key);

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
        builder: (context, model, child) => Column(
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                  itemCount: widget.userNotes.notes.length,
                  itemBuilder: (context, int index){
                    return Container(
                      height: usableScreenHeight*0.1,
                      child: Card(
                        child: Text(widget.userNotes.notes[index].title),
                      ),
                    );
                  }
              ),
          ],
        )
    );
  }
}
