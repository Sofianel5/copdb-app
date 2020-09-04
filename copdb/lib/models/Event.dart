import 'package:flutter/widgets.dart';

class Event
{
  int id;
  String title;
  String description;
  String location;
  String date;
  AssetImage imageLocation;
  int likes;
  int comments;

  Event(this.title, this.date, this.comments, this.likes, this.location, this.description, this.imageLocation);
  Event.withId(this.id, this.title, this.date, this.comments, this.likes, this.location, this.description, this.imageLocation);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'title': title,
      'date': date,
      'comments' : comments,
      'likes' : likes,
      'location' : location,
      'description' : description,
      'imageLocation' : imageLocation,
    };
  }

  Event.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
		this.title = map['title'];
		this.date = map['date'];
    this.comments = map['comments'];
    this.likes = map['likes'];
    this.location = map['location'];
    this.description = map['description'];
    this.imageLocation = map['imageLocation'];
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id, title: $title, date: $date, comments: $comments, likes: $likes, location: $location}, description: $description';
  }
}