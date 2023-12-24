import 'package:flutter/material.dart';
import 'package:hoshna_tv/stream_screen/video_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

final VideoPlayerController videoPlayerController =
VideoPlayerController.networkUrl(
    Uri.parse('https://pixelsmedia.live/hoshannatvlive/index.m3u8'));

class _StreamScreenState extends State<StreamScreen> {
  late final ChewieController chewieController;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        autoInitialize: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          Image.asset('assets/images/curve.png'),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,top: 45),
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://pixelsmediaagency.com'));
              },
              child: Text(
                'POWERD BY \nWWW.PIXELSMEDIAAGENCY.COM',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),

          Container(
            height: 200,
            width: double.infinity,
            child: VideoPlayerWidget(
                'https://pixelsmedia.live/hoshannatvlive/index.m3u8'),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('https://hoshannatelevision.tv/'));
            },
            child: Text(
              'CONTACT US \nWWW.HOSHANNATELEVISION.TV',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xffffc107),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset('assets/images/main_player_bg.png'),
          SizedBox(
            height: 110,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://api.whatsapp.com/send?phone=%2B923035282696&app=facebook&entry_point=page_cta&fbclid=IwAR2Ehelx3aSWN-QM4raWwLF6kF2cDzO1WIiOsPMhtaq_QAmkckm5dpHqc2o'));
                },
                child: Image.asset(
                  'assets/icons/whats.png',
                  scale: 10,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://www.facebook.com/profile.php?id=100088528878067'));
                },
                child: Image.asset(
                  'assets/icons/facebook.png',
                  scale: 10,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrl(
                      Uri.parse('https://www.youtube.com/@hoshannatv/videos'));
                },
                child: Image.asset(
                  'assets/icons/youtube.png',
                  scale: 10,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://www.instagram.com/hoshannatvofficial'));
                },
                child: Image.asset(
                  'assets/icons/instagram.png',
                  scale: 10,
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://twitter.com/hoshannatv'));
                },
                child: Image.asset(
                  'assets/icons/twitter.png',
                  scale: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      try {
        await launchUrl(Uri.parse(url));
      } catch (e) {
        print('Error launching URL: $e');
      }
    } else {
      print('Invalid URL: $url');
    }
  }
}
