import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/finish.dart';
import 'package:video_player/video_player.dart'; // Import video_player
import 'dart:async';

import 'package:se215_nutrifit/presentation/screens/workout/exercise/relex.dart';

class ExerciseProgressScreen extends StatefulWidget {
  final int step;

  ExerciseProgressScreen({required this.step});
  @override
  _ExerciseProgressScreenState createState() => _ExerciseProgressScreenState();
}

class _ExerciseProgressScreenState extends State<ExerciseProgressScreen> {
  int _seconds = 20;
  Timer? _timer;
  bool _isButtonEnabled = false;

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Khởi tạo VideoPlayerController
    _videoController = VideoPlayerController.asset("assets/videos/sample.mp4")
      ..initialize().then((_) {
        setState(() {}); // Cập nhật UI khi video được load xong
        _videoController.setLooping(true); // Lặp video
        _videoController.play(); // Phát video tự động
      });

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (widget.step == 10) {
            _timer?.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FinishScreen()),
            );
          } else {
            _isButtonEnabled = true;
            _timer?.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RelaxScreen(step: widget.step)),
            );
            _seconds = 20;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _videoController.dispose(); // Giải phóng tài nguyên của video
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          // Thay thế hình ảnh bằng video

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: _videoController.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(60.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
          ), // Hiển thị khi video chưa tải xong

          const Spacer(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '00:${_seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
              label: const Text('Bước cao'),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: widget.step == 1
                          ? const Color.fromARGB(255, 155, 155, 155)
                          : Colors.black,
                      width: 2),
                ),
                child: IconButton(
                  icon: const Icon(Icons.skip_previous, size: 40),
                  onPressed: widget.step == 1
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseProgressScreen(
                                    step: widget.step - 1)),
                          );
                        },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_timer?.isActive ?? false) {
                      _timer?.cancel();
                    } else {
                      _startTimer();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.xanh_ngoc_nhat,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width - 180, 70),
                ),
                child: Icon(
                  _timer?.isActive ?? false ? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: IconButton(
                  icon: const Icon(Icons.skip_next, size: 40),
                  onPressed: () {
                    if (widget.step == 10) {
                      _timer?.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinishScreen()),
                      );
                    } else {
                      _isButtonEnabled = true;
                      _timer?.cancel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RelaxScreen(step: widget.step)),
                      );
                      _seconds = 20;
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ProgressBar(progress: widget.step, max: 10),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int progress;
  final int max;

  ProgressBar({required this.progress, required this.max});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barWidth = (screenWidth - (max - 1) * 4 - 6) / max;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(max, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: barWidth,
          height: 5,
          decoration: BoxDecoration(
            color: index < progress
                ? AppColors.xanh_ngoc_nhat
                : AppColors.xam_thuong,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
