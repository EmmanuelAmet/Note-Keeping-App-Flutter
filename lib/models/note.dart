class Note
{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority,[this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,[this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  //Set Title
  set title(String newTitle)
  {
    if(newTitle.length <= 2565)
      {
        this._title = newTitle;
      }
  }

  //Set Description
  set description(String newDescription)
  {
    if(newDescription.length <= 2565)
    {
      this._title = newDescription;
    }
  }

  //Set Priority
  set priority(int newPriority)
  {
    if(newPriority >= 1 && newPriority <= 2)
    {
      this._priority = newPriority;
    }
  }

  //Set Date
  set date(String newDate)
  {
      this._date = newDate;
  }

  //Converting Note Object to Map Object
  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic>();
    if(id != null)
    {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  //The code below will Extract the Note Object from Map Object
  Note.fromMapObject(Map<String, dynamic>map)
  {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}