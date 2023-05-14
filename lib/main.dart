import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik_app/infrastructure/repositories/videos_posts_repository_impl.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover/discover_screen.dart';

import 'config/theme/AppTheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepositoryImpl = VideoPostsRepositoryImpl(
        videoPostDatasource: LocalVideoDataSourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          // si colocamos esta propiedad lo que va a realizar es que se lanze inmediatamente es creada la propiedad
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepositoryImpl)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const Scaffold(body: DiscoverScreen()),
      ),
    );
  }
}
