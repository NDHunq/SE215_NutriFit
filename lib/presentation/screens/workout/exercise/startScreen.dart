import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:video_player/video_player.dart'; // Import video_player
import 'dart:async';

import 'package:se215_nutrifit/presentation/screens/workout/exercise/progessScreen.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int countdown = 6;
  Timer? timer;
  bool isPaused = false;
  late VideoPlayerController _videoController;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0 && !isPaused) {
        setState(() {
          countdown--;
        });
      } else if (countdown == 0) {
        timer.cancel();
        navigateToNextScreen();
      }
    });
  }

  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExerciseProgressScreen(
                step: 1,
              )),
    );
    timer?.cancel();
  }

  void showInfoForm() {
    setState(() {
      isPaused = true;
    });
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin bài tập',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Bài tập này giúp tăng cường nhóm cơ bụng và cơ mông.'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    isPaused = false;
                  });
                },
                child: Text('Đóng'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // Khởi tạo VideoPlayerController
    _videoController = VideoPlayerController.asset(
        "assets/videos/sample.mp4") // Đường dẫn video trong assets
      ..initialize().then((_) {
        setState(() {}); // Cập nhật UI sau khi video load xong
        _videoController.setLooping(true); // Lặp video
        _videoController.play(); // Tự động phát
      });

    startTimer();
  }

  @override
  void dispose() {
    _videoController.dispose(); // Hủy video controller
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  _videoController.value.isInitialized
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        )
                      : CircularProgressIndicator(), // Hiển thị khi video chưa load xong
                  SizedBox(height: 50),
                  Text(
                    'Đã sẵn sàng luyện tập',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: CircularProgressIndicator(
                              color: AppColors.xanh_ngoc_nhat,
                              value: countdown / 6,
                              strokeWidth: 6,
                            ),
                          ),
                          Text(
                            '$countdown',
                            style: TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          navigateToNextScreen();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: showInfoForm,
                    icon: Icon(Icons.help_outline),
                    label: Text('Bước cao'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
