import 'package:list_project/album_response_object.dart';

abstract class AlbumRepository {
  Future<List<AlbumResponseObject>> fetchAlbums();
}
