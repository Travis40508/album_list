import 'package:list_project/album_response_object.dart';

abstract class AlbumService {
  Future<List<AlbumResponseObject>> fetchAlbums();
}
