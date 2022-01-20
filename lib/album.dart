class Album {
  final int userId;
  final int id;
  final String title;

  Album.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'];
}
