import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class ViewTestVideo extends StatefulWidget {
  const ViewTestVideo({Key? key}) : super(key: key);

  @override
  State<ViewTestVideo> createState() => _ViewTestVideoState();
}

class _ViewTestVideoState extends State<ViewTestVideo> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        'https://munastiedu.com/storage/videos/LS9TDoa58jV6etHsccvNljQt1jzPq6pTSQEOluXU.mp4',
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('External Video Player'),
      ),
      body: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: const FlickVideoWithControls(
          controls: CustomPortraitControls(),
        ),
        flickVideoWithControlsFullscreen: const FlickVideoWithControls(
          controls: CustomLandscapeControls(),
        ),
      ),
    );
  }
}

class CustomPortraitControls extends StatelessWidget {
  const CustomPortraitControls({super.key});

  @override
  Widget build(BuildContext context) {
    return FlickPortraitControls(
      progressBarSettings: FlickProgressBarSettings(
        handleColor: Colors.grey, // Color of the handle
        playedColor: Colors.green, // Color of the played portion
        handleRadius: 8, // Size of the handle circle
      ),
      iconSize: 20,
      fontSize: 12,
    );
  }
}

class CustomLandscapeControls extends StatelessWidget {
  const CustomLandscapeControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlickLandscapeControls();
  }
}
