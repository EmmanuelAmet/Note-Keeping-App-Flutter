import 'package:flutter/material.dart';
import './note_detail.dart';
import './about.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }

}


class NoteListState extends State<NoteList>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        Scaffold(
          appBar: AppBar(
            title: Text("Notes"),
          ),

          //Side Bar
          drawer: new Drawer(
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('Emmanuel Cypher'),
                  accountEmail: new Text('Developer'),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                    //backgroundImage: new NetworkImage('./images/logo.png'),
                  ),
                ),
                new ListTile(
                  leading: Icon(Icons.people),
                  title: new Text('About'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new AboutPage()));
                  },
                ),

                new ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: new Text('Contact Developer'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new AboutPage()));
                  },
                ),

                new ListTile(
                  leading: Icon(Icons.share),
                  title: new Text('Share'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new AboutPage()));
                  },
                ),

                new ListTile(
                  leading: Icon(Icons.star),
                  title: new Text('Rate this App'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new AboutPage()));
                  },
                ),

              ],
            ),
          ),

          body: getNoteListView(),
          floatingActionButton: FloatingActionButton(onPressed: (){
            debugPrint("FBA Clicked");
            navigateToDetail('Add Note');
          },
          tooltip: 'Add Note',
            child: Icon(Icons.add),
          ),

          /*bottomNavigationBar: BottomAppBar(
            child:
            Container( height: 40.0, child:
              Text(''),
              color: Colors.deepOrange,
            )
          ),*/
        );

  }
ListView  getNoteListView()
{
  TextStyle titleStyle = Theme.of(context).textTheme.subhead;
  return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
      return Card(
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Icon(Icons.keyboard_arrow_right),
          ),
          title: Text("Dummy Tttle", style: titleStyle,),
          subtitle: Text("Dummy Date"),
          trailing: Icon(Icons.delete, color: Colors.grey,),
          onTap: (){
            debugPrint("ListTitle Tapped");
            navigateToDetail('Eidt Note');
          },
        ),
      );
      },
  );
}
void navigateToDetail(String title)
{
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return NoteDetail(title);
  }));
}

}
//class AppLogo extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    AssetImage assetImage = AssetImage('images/logo.png');
//    Image image = Image(image: assetImage);
//    return Container(child: image,);
//  }
//}
