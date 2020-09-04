import 'package:flutter/widgets.dart';

class Notification
{
  int id;
  String title;
  String description;
  String location;
  String date;

  Notification(this.title, this.date,  this.location, this.description);
  Notification.withId(this.id, this.title, this.date, this.location, this.description);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'title': title,
      'date': date,
      'location' : location,
      'description' : description,
    };
  }

  Notification.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
		this.title = map['title'];
		this.date = map['date'];
    this.location = map['location'];
    this.description = map['description'];
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id, title: $title, date: $date, location: $location}, description: $description';
  }
}