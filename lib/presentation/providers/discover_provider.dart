import 'package:flutter/cupertino.dart';
import 'package:tok_tik_app/domain/repository/video_post_repository.dart';
import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    List<VideoPost> newVideos =
        await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    // todo: cargar videos

    notifyListeners();
  }
}
