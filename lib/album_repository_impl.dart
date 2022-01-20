import 'package:list_project/album_repository.dart';
import 'package:list_project/album_response_object.dart';
import 'package:list_project/album_service.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumService service;

  const AlbumRepositoryImpl({
    required this.service,
  });

  @override
  Future<List<AlbumResponseObject>> fetchAlbums() async {
    final response = await service.fetchAlbums();

    return response;
  }
}
