import 'package:flutter/widgets.dart';

class Friend
{
  int id;
  String fname;
  String lname;
  String date;
  IconData icon;

  Friend(this.fname, this.lname, this.date, this.icon);
  Friend.withId(this.id, this.fname, this.lname, this.date, this.icon);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'fname': fname,
      'lname': lname,
      'date': date,
      'icon' : icon,
    };
  }

  Friend.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
		this.fname = map['fname'];
    this.lname = map['lname'];
		this.date = map['date'];
    this.icon = map['icon'];
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id, fname: $fname, lname: $lname, date: $date}';
  }
}