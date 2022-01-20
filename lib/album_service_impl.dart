import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:list_project/album.dart';
import 'package:list_project/album_response_object.dart';
import 'package:list_project/album_service.dart';

class AlbumServiceImpl implements AlbumService {
  final _client = Client();

  @override
  Future<List<AlbumResponseObject>> fetchAlbums() async {
    const url = 'https://jsonplaceholder.typicode.com/albums';
    final response = await _client.get(Uri.parse(url));
    final jsonArray = jsonDecode(response.body);

    final responseList =
        (jsonArray as List).map((album) => Album.fromJson(album)).toList();

    return responseList
        .map((album) => AlbumResponseObject(title: album.title, id: album.id))
        .toList();
  }
}
