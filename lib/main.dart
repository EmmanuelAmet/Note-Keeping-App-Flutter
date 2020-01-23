import 'package:flutter/material.dart';
import './screens/note_list.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MaterialApp(
        title: "Note Book",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        home: NoteList(),
      );
  }

}

