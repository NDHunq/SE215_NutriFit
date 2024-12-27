import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart'; // Import thư viện video_player

import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/progessScreen.dart';

class RelaxScreen extends StatefulWidget {
  final int step;

  RelaxScreen({required this.step});
  @override
  _RelaxScreenState createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  int _remainingTime = 20;
  Timer? _timer;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Khởi tạo video controller
    _videoController = VideoPlayerController.asset('assets/videos/sample.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh UI khi video đã sẵn sàng
        _videoController.play(); // Tự động phát video
        _videoController.setLooping(true); // Lặp lại video
      });

    // Bắt đầu bộ đếm thời gian
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _skipTimer();
        }
      });
    });
  }

  void _addTime() {
    setState(() {
      _remainingTime += 10;
    });
  }

  void _skipTimer() {
    setState(() {
      _timer?.cancel();
      _remainingTime = 0;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExerciseProgressScreen(
                step: widget.step + 1,
              )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _videoController.dispose(); // Đừng quên hủy video controller
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.xanh_ngoc_nhat,
      appBar: AppBar(
        backgroundColor: AppColors.xanh_ngoc_nhat,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Tiếp theo ${widget.step + 1}/10',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.help_outline,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Bước cao',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '00:20',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                const SizedBox(height: 10),
                // Hiển thị video thay vì ảnh
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: _videoController.value.isInitialized
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(60.0),
                          child: CircularProgressIndicator(),
                        ),
                ), // Hiển thị khi video chưa sẵn sàng
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'NGHỈ NGƠI',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            _formatTime(_remainingTime),
            style: const TextStyle(
                fontSize: 68, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addTime,
                child: const Text('+10s',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: const Size(110, 50),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _skipTimer,
                child: const Text('Bỏ qua',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.xanh_ngoc_nhat,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: const Size(110, 50),
                ),
              ),
            ],
          ),
          const Spacer(),
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
            color: index < progress ? Colors.white : AppColors.xam_thuong,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
