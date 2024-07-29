import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class MyApp2123123123 extends StatefulWidget {
  const MyApp2123123123({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2123123123> {
  bool fullscreen = false;
  String currentUrl = "https://munastiedu.com/storage/videos/LS9TDoa58jV6etHsccvNljQt1jzPq6pTSQEOluXU.mp4"; // Default URL
  List<Map<String, String>> videoQualities = [
    {'quality': 'Low', 'url': 'https://example.com/video_low.mp4'},
    {'quality': 'Medium', 'url': 'https://example.com/video_medium.mp4'},
    {'quality': 'High', 'url': 'https://munastiedu.com/storage/videos/LS9TDoa58jV6etHsccvNljQt1jzPq6pTSQEOluXU.mp4'}
  ];

  void changeVideoQuality(String url) {
    setState(() {
      currentUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Icon(Icons.abc_outlined),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: changeVideoQuality,
              itemBuilder: (BuildContext context) {
                return videoQualities.map((Map<String, String> quality) {
                  return PopupMenuItem<String>(
                    value: quality['url'],
                    child: Text(quality['quality']!),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding:
          fullscreen ? EdgeInsets.zero : const EdgeInsets.only(top: 32.0),
          child: YoYoPlayer(
            aspectRatio: 16 / 9,
            url: currentUrl,
            videoStyle: const VideoStyle(
              playButtonIconSize: 40.0,
              playIcon: Icon(
                Icons.add_circle_outline_outlined,
                size: 40.0,
                color: Colors.white,
              ),
              pauseIcon: Icon(
                Icons.remove_circle_outline_outlined,
                size: 40.0,
                color: Colors.white,
              ),
            ),
            videoLoadingStyle: const VideoLoadingStyle(
              loading: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onFullScreen: (value) {
              setState(() {
                fullscreen = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
