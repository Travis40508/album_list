import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_project/album_repository.dart';
import 'package:list_project/album_repository_impl.dart';
import 'package:list_project/album_service.dart';
import 'package:list_project/album_service_impl.dart';
import 'package:list_project/list_application.dart';

final sl = GetIt.instance;

void main() {
  _buildDependencyGraph();
  runApp(const ListApplication());
}

void _buildDependencyGraph() {
  sl.registerSingleton<AlbumService>(AlbumServiceImpl());
  sl.registerSingleton<AlbumRepository>(
    AlbumRepositoryImpl(
      service: sl<AlbumService>(),
    ),
  );
}
