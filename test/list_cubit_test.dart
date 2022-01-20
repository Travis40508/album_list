import 'package:flutter_test/flutter_test.dart';
import 'package:list_project/album_list_state.dart';
import 'package:list_project/album_repository.dart';
import 'package:list_project/album_response_object.dart';
import 'package:list_project/list_cubit.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late AlbumRepository repository;

  setUp(() {
    repository = MockRepository();
  });

  test('Initial State', () {
    when(() => repository.fetchAlbums())
        .thenAnswer((_) async => await _fetchDummyData());
    final cubit = ListCubit(repository: repository);

    expect(cubit.state, AlbumListLoadingState());
  });

  test('Loaded State', () async {
    when(() => repository.fetchAlbums())
        .thenAnswer((_) async => await _fetchDummyData());
    final cubit = ListCubit(repository: repository);
    cubit.load();

    await pumpEventQueue();

    expect(cubit.state, AlbumListLoadedState(albums: await _fetchDummyData()));
  });

  test('Error State', () async {
    when(() => repository.fetchAlbums())
        .thenThrow((_) => Future.error(Error()));
    final cubit = ListCubit(repository: repository);
    cubit.load();

    await pumpEventQueue();

    expect(cubit.state, AlbumListErrorState());
  });
}

class MockRepository extends Mock implements AlbumRepository {}

Future<List<AlbumResponseObject>> _fetchDummyData() {
  final albums = [
    const AlbumResponseObject(title: 'Testing', id: 1),
    const AlbumResponseObject(title: 'Testing2', id: 2),
    const AlbumResponseObject(title: 'Testing3', id: 3),
  ];

  return Future.value(albums);
}
