import 'package:flutter/material.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/preExercise.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/setting.dart';
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

  void showInfoForm() {
    setState(() {
      _timer?.cancel();
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
        _startTimer();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.xanh_ngoc_nhat,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              _timer?.cancel();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              ).then((_) {
                _startTimer(); // Start timer again when returning from settings
              });
            },
          ),
        ],
        backgroundColor: AppColors.xanh_ngoc_nhat,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            _timer?.cancel();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Bạn có muốn dừng luyện tập không?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        _startTimer(); // Continue the timer
                      },
                      child: const Text('Không'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _timer?.cancel(); // Close the dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreExerciseScreen()),
                        );
                      },
                      child: const Text('Dừng'),
                    ),
                  ],
                );
              },
            );
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
                            onPressed: showInfoForm,
                            icon: const Icon(
                              Icons.help_outline,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Leo núi',
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
