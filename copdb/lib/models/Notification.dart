import 'package:flutter/widgets.dart';

class ListNotification
{
  int id;
  String title;
  String description;
  String location;
  String date;

  ListNotification(this.title, this.date,  this.location, this.description);
  ListNotification.withId(this.id, this.title, this.date, this.location, this.description);

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

  ListNotification.fromMapObject(Map<String, dynamic> map) 
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