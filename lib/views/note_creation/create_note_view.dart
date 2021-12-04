import 'package:flutter/material.dart';
import 'package:noteyio/constants/app_styles.dart';
import 'package:noteyio/views/note_creation/create_note_view_model.dart';
import 'package:noteyio/widgets/default_button.dart';
import 'package:stacked/stacked.dart';

class CreateNoteView extends StatefulWidget {

  final VoidCallback refresh;

  const CreateNoteView({Key? key, required this.refresh}) : super(key: key);

  @override
  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateNoteViewModel>.reactive(
        viewModelBuilder: () => CreateNoteViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: AppStyles.kDefaultDarkColor,
          appBar: AppBar(
            title: Text(
              "New Note",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Title',
                        labelText: 'Note Title:',
                      ),
                      enableSuggestions: true,
                      autocorrect: false,
                      onChanged: (value) {
                        model.title = value;
                      },
                    ),
                  )
                ),
                Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Text',
                          labelText: 'Note Text:',
                        ),
                        enableSuggestions: true,
                        autocorrect: false,
                        onChanged: (value) {
                          model.text = value;
                        },
                      ),
                    )
                ),
                Center(
                  child: DefaultButton(
                    onTapped: () async {
                      bool? complete = await model.createPressed();
                      print(complete);
                      if(complete){
                        widget.refresh();
                        Navigator.pop(context);
                      }else{
                        //error
                      }
                    },
                    text: 'Create',
                  ),
                ),
              ]
            ),
          ),
        )
    );
  }
}
