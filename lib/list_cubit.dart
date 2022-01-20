import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_project/album_list_state.dart';
import 'package:list_project/album_repository.dart';

class ListCubit extends Cubit<AlbumListState> {
  final AlbumRepository repository;

  ListCubit({required this.repository}) : super(AlbumListLoadingState()) {
    load();
  }

  @visibleForTesting
  void load() async {
    try {
      final albums = await repository.fetchAlbums();
      emit(AlbumListLoadedState(albums: albums));
    } catch (e) {
      emit(AlbumListErrorState());
    }
  }
}
