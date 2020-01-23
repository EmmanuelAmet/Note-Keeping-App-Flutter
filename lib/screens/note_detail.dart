import 'package:flutter/material.dart';


class NoteDetail extends StatefulWidget{
  String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail>{
  static var _priotities = ["High", "Low"];

  String appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope(
      onWillPop: (){
        //The code below will execute when the user press the back button in the App Bar
        moveToLastScreen();
      },
    child:
        Scaffold(
          appBar: AppBar(
              title: Text(appBarTitle),
            leading: IconButton(icon: Icon(
                Icons.arrow_back_ios),
              onPressed: (){
                //The code below will execute when the user press the back button in the App Bar
                moveToLastScreen();
              },),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[

                //First Element
                ListTile(
                    title: DropdownButton(
                      items: _priotities.map((String dropDownStringItem){
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      style: textStyle,
                      value: 'Low',
                      onChanged: (value){
                        debugPrint('User Selected $value');
                      },
                    )
                ),

                //Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value){
                      debugPrint('Something Changed in the Title Text Field');
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                  ),
                ),

                //Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value){
                      debugPrint('Something Changed in the Description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ),

                //Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: (){
                            setState((){
                              debugPrint('Save Button Clicked');
                            });
                          },
                        ),
                      ),

                      //Container
                      Container(width: 1.5,),
                      //Delete Button
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: (){
                            setState((){
                              debugPrint('Delete Button Clicked');
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),);
  }

  void moveToLastScreen()
  {
    Navigator.pop(context);
  }

}