import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  var chewieController;

  final videoPlayerController = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  );

  @override
  void initState() {
    super.initState();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Chewie(
                  controller: chewieController,
                ),
              ),
            ),
            Container(
              child: RaisedButton(
                color: Colors.green,
                child: Text('Select video quality'),
                onPressed: () {
                  modalBottomSheetMenu(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void modalBottomSheetMenu(
    BuildContext context,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (_) {
        return GestureDetector(
          child: Container(
            height: 320,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  onTap: () {
                    videoPlayerController.seekTo(Duration.zero);
                    Navigator.of(context).pop();
                  },
                  title: Center(
                    child: Text(
                      'Auto',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    videoPlayerController.seekTo(Duration.zero);
                    Navigator.of(context).pop();
                  },
                  title: Center(
                    child: Text(
                      '1080p',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    videoPlayerController.seekTo(Duration.zero);
                    Navigator.of(context).pop();
                  },
                  title: Center(
                    child: Text(
                      '720p',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    videoPlayerController.seekTo(Duration.zero);
                    Navigator.of(context).pop();
                  },
                  title: Center(
                    child: Text(
                      '480p',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  indent: 20.0,
                  endIndent: 20.0,
                  thickness: 1,
                  color: Colors.black,
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  title: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
