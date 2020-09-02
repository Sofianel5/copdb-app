class Event
{
  int id;
  String title;
  String description;
  String location;
  String date;
  int likes;
  int comments;

  Event(this.title, this.date, this.comments, this.likes, this.location, this.description);
  Event.withId(this.id, this.title, this.date, this.comments, this.likes, this.location, this.description);

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
  }

  @override
  String toString() 
  {
    return 
      'Task{id: $id, title: $title, date: $date, comments: $comments, likes: $likes, location: $location}, description: $description';
  }
}