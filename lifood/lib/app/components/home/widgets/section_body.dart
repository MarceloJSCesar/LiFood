import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:video_player/video_player.dart';

class SectionBody extends StatefulWidget {
  final dynamic data;
  final videoUrl;
  SectionBody({
    Key key,
    this.data,
    this.videoUrl,
  }) : super(key: key);

  @override
  _SectionBodyState createState() => _SectionBodyState();
}

class _SectionBodyState extends State<SectionBody> {
  VideoPlayerController _controller;

  @override
  void initState() {
    print('VideoUrl: ${widget.videoUrl}');
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null && _controller.value.isInitialized
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : Center(
            child: CustomCircularProgressIndicator(),
          );
  }
}
