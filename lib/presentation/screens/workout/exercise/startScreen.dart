import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/preExercise.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/setting.dart';
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
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề bài tập
                  Text(
                    'Leo núi',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  // Các nút: 2D, Video, Cơ bắp

                  // Thời lượng
                  Row(
                    children: [
                      Text(
                        'Thời lượng:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.xanh_ngoc_dam),
                      ),
                      Spacer(),
                      Text(
                        '00:20',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  // Giới thiệu
                  Text(
                    'Giới thiệu',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.xanh_ngoc_dam),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bắt đầu ở tư thế chống đẩy. Co gối phải về phía ngực và giữ chân trái thẳng, sau đó nhanh chóng chuyển sang chân khác. Bài tập này tăng cường nhiều nhóm cơ.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  // Vùng tập trung
                  Text(
                    'Vùng tập trung',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.xanh_ngoc_dam),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Chip(
                        label: Text('Bụng'),
                        backgroundColor: AppColors.xam_nhat,
                      ),
                      SizedBox(width: 10),
                      Chip(
                        label: Text('Cơ mông'),
                        backgroundColor: AppColors.xam_nhat,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Ảnh minh họa
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/leonui.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        isPaused = false;
      });
    });
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
            onPressed: () {
              timer?.cancel();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              ).then((_) {
                startTimer(); // Start timer again when returning from settings
              });
            },
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
                    onPressed: () {
                      showInfoForm();
                    },
                    icon: Icon(Icons.help_outline),
                    label: Text('Leo núi'),
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
