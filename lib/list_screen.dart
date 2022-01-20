import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_project/album_list_state.dart';
import 'package:list_project/album_repository.dart';
import 'package:list_project/list_cubit.dart';
import 'package:list_project/main.dart';

class ListScreen extends StatelessWidget {
  @visibleForTesting
  final ListCubit? cubit;

  const ListScreen({Key? key, @visibleForTesting this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Application'),
      ),
      body: BlocProvider<ListCubit>(
        create: (context) =>
            cubit ?? ListCubit(repository: sl<AlbumRepository>()),
        child: BlocBuilder<ListCubit, AlbumListState>(
          builder: (context, state) {
            if (state is AlbumListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbumListErrorState) {
            } else if (state is AlbumListLoadedState) {
              return ListView.builder(
                itemCount: state.albums.length,
                itemBuilder: (context, index) {
                  final album = state.albums[index];

                  return Card(
                    elevation: 4.0,
                    child: ListTile(
                      title: Text(album.title),
                      subtitle: Text(album.id.toString()),
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
