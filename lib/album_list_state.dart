import 'package:equatable/equatable.dart';
import 'package:list_project/album_response_object.dart';

abstract class AlbumListState extends Equatable {}

class AlbumListLoadingState extends AlbumListState {
  @override
  List<Object?> get props => [];
}

class AlbumListErrorState extends AlbumListState {
  @override
  List<Object?> get props => [];
}

class AlbumListLoadedState extends AlbumListState {
  final List<AlbumResponseObject> albums;

  AlbumListLoadedState({
    required this.albums,
  });

  @override
  List<Object?> get props => [albums];

  AlbumListLoadedState copyWith({
    List<AlbumResponseObject>? albums,
  }) {
    return AlbumListLoadedState(
      albums: albums ?? this.albums,
    );
  }
}
