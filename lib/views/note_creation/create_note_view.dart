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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var _tagController = TextEditingController();
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
                        autocorrect: true,
                        minLines: 2,
                        maxLines: 6,
                        onChanged: (value) {
                          model.text = value;
                        },
                      ),
                    )
                ),
                Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "Tags",
                            style: AppStyles.kHeadingTextStyle
                          ),
                          model.tags.isEmpty ? Center(child: Text('No Tags Set')):ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.tags.length,
                              itemBuilder: (context, int index) {
                                return Text('• '+model.tags[index]);
                              }
                          ),
                        ],
                      )
                    )
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Card(
                          child: Container(
                            width: screenWidth*0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _tagController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Tag Name',
                                  labelText: 'Add Tag:',
                                ),
                                enableSuggestions: true,
                                autocorrect: false,
                                onChanged: (value) {
                                  model.currentTag = value;
                                },
                              ),
                            ),
                          )
                      ),
                    ),
                    DefaultButton(
                      onTapped: () async {
                        bool complete =  model.addTagToList(model.currentTag);
                        print(complete);
                        if(complete){
                          _tagController.clear();
                          model.currentTag = '';
                          setState(() {
                          });
                        }else{
                          //error

                          //Dismiss keyboard
                          FocusScope.of(context).requestFocus(new FocusNode());

                        }
                      },
                      text: 'Add Tag',
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                    text: 'Create Note',
                  ),
                ),
              ]
            ),
          ),
        )
    );
  }
}
