import 'package:flutter/material.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik_app/presentation/widgets/video/full_screen_player.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            // todo: videoplayer
            SizedBox.expand(
                child: FullScreenPlayer(
              videoUrl: videoPost.videoUrl,
              caption: videoPost.caption,
            )),
            // todo: gradient
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
