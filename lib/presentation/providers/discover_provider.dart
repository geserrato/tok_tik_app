import 'package:flutter/cupertino.dart';
import 'package:tok_tik_app/infrastructure/models/local_video_model.dart';
import 'package:tok_tik_app/shared/data/local_video_post.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    // todo: cargar videos

    notifyListeners();
  }
}
