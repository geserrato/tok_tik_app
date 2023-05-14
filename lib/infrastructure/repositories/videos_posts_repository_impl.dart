import 'package:tok_tik_app/domain/datasource/video_posts_datasource.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/domain/repository/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;

  VideoPostsRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
