class Todo{
  int id;
  int userId;
  bool completed;
  String title;

  Todo(int id, int userId, bool completed, String title){
    this.id = id;
    this.title = title;
    this.userId = userId;
    this.completed = completed;

  }

  Todo.fromJson(Map json){
    id = json["id"];
    userId =json["userId"];
    completed = json["completed"];
    title = json["title"];
  }


  Map toJson(){
    return {"id":id, "userId":userId,"completed":completed,"title":title};
  }

}