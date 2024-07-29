import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/play_video/controller/play_video_controller.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  final int videoUrl;

  const PlayVideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoPlayerController? controller;
  late FlickManager? flickManager;
  late final PlayVideoController playVideoController;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() async {
    playVideoController =
        Get.put(PlayVideoController(courseId: widget.videoUrl));
    await playVideoController.initCompleter.future;
    _setupVideo();
  }

  void _setupVideo() {
    if (playVideoController.playVideoModel?.videoUrl != null) {
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.networkUrl(
              Uri.parse(playVideoController.playVideoModel!.videoUrl))
            ..initialize().then((_) {
              if (mounted) {
                setState(() {});
              }
            }).catchError((error) {
              print('Error initializing video player: $error');
            }));
    } else {
      print('Video URL is not available.');
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Get.delete<PlayVideoController>();
    controller?.dispose();
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (playVideoController.loading.isTrue) {
          return Center(child: loadingAppWidget());
        } else if (flickManager != null) {
          return Stack(
            children: [

              Container(
                color: Color(0xFF171717),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Center(
                child: AspectRatio(

                  aspectRatio: flickManager!.flickVideoManager!.videoPlayerController!.value.aspectRatio,
                  child: FlickVideoPlayer(

                    flickManager: flickManager!,
                    flickVideoWithControls: FlickVideoWithControls(

                      videoFit: BoxFit.fill,
                      playerLoadingFallback: loadingAppWidget(),
                      controls: const CustomPortraitControls(),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(child: loadingAppWidget());
        }
      }),
    );
  }
}

class CustomPortraitControls extends StatelessWidget {
  const CustomPortraitControls({super.key});

  @override
  Widget build(BuildContext context) {
    return FlickPortraitControls(
      progressBarSettings: FlickProgressBarSettings(
        handleColor: ColorManager.app2,
        playedColor: ColorManager.app9,
        handleRadius: 8,
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
    return FlickPortraitControls(
      progressBarSettings: FlickProgressBarSettings(
        handleColor: ColorManager.app2, // لون المقبض
        playedColor: ColorManager.app9, // لون الجزء المشغل
        handleRadius: 8, // حجم المقبض الدائري
      ),
      iconSize: 20,
      fontSize: 12,
    );
  }
}
