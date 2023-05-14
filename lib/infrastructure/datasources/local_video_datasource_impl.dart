import 'package:tok_tik_app/domain/entities/video_post.dart';

import '../../domain/datasource/video_posts_datasource.dart';
import '../../shared/data/local_video_post.dart';
import '../models/local_video_model.dart';

class LocalVideoDataSourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 3));

    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
