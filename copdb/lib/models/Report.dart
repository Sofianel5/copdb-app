import 'package:flutter/widgets.dart';

class Report
{
  int id;
  String firstname;
  String lastname;
  String age;
  String sex;
  String allegation;
  String description;
  String date;
  String location;
  AssetImage imageLocation;

  Report(
    this.firstname, 
    this.lastname, 
    this.age, 
    this.sex, 
    this.allegation, 
    this.date, 
    this.location, 
    this.description, 
    this.imageLocation
  );
  Report.withId(
    this.id, 
    this.firstname, 
    this.lastname, 
    this.age, 
    this.sex, 
    this.allegation, 
    this.date, 
    this.location, 
    this.description, 
    this.imageLocation,
  );

  Map<String, dynamic> toMap() 
  {
    return 
    {
      'id': id, 
      'firstname' : firstname,
      'lastname' : lastname,
      'age' : age,
      'sex' : sex,
      'allegtion' : allegation,
      'date': date,
      'location' : location,
      'description' : description,
      'imageLocation' : imageLocation,
    };
  }

  Report.fromMapObject(Map<String, dynamic> map) 
  {
		this.id = map['id'];
    this.firstname = map['firstname'];
    this.lastname = map['lastname'];
    this.age = map['age'];
    this.sex = map['sex'];
    this.allegation = map['allegation'];
		this.date = map['date'];
    this.location = map['location'];
    this.description = map['description'];
    this.imageLocation = map['imageLocation'];
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id, fname: $firstname, lname: $lastname, age: $age, sex: $sex, allegation: $allegation, date: $date, location: $location}, description: $description';
  }
}