import 'package:flutter/widgets.dart';

class ReportPreview
{
  int id;
  String firstname;
  String lastname;
  IconData icon;
  String date;
  String abuse;

  ReportPreview(this.firstname, this.lastname, this.icon, this.date,  this.abuse);
  ReportPreview.withId(this.id, this.firstname, this.lastname, this.icon, this.date,  this.abuse);

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
    };
  }

  ReportPreview.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id';
  }
}