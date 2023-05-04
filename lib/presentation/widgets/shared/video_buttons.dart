import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik_app/config/helpers/human_formats.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        const SizedBox(height: 20),
        _CustomIconButton(
            value: video.views,
            iconData: Icons.remove_red_eye_outlined,
            iconColor: Colors.white),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
              value: 0,
              iconData: Icons.play_circle_outline,
              iconColor: Colors.white),
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble()))
      ],
    );
  }
}