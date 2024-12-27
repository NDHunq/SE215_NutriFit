import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/workout/workoutPage.dart';

class FinishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: 210,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.xanh_ngoc_nhat,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Tập luyện',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'đã hoàn thành!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _infoCard('10', 'Động tác'),
                            const SizedBox(width: 5),
                            _infoCard('10 phút', 'Thời gian'),
                            const SizedBox(width: 5),
                            _infoCard('100', 'Calo'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FeedbackSection(),
                const SizedBox(height: 20),
                _updateMetricsSection(),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WorkoutPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.xanh_ngoc_nhat,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 80),
                    minimumSize:
                        const Size(double.infinity, 60), // Set the height to 50
                  ),
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class FeedbackSection extends StatefulWidget {
  @override
  _FeedbackSectionState createState() => _FeedbackSectionState();
}

class _FeedbackSectionState extends State<FeedbackSection> {
  String? selectedFeedback;

  void _selectFeedback(String feedback) {
    setState(() {
      selectedFeedback = feedback;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bạn cảm thấy thế nào?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Phản hồi của bạn sẽ giúp chúng tôi cung cấp các bài tập phù hợp hơn cho bạn',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _emojiFeedback(Icons.sentiment_dissatisfied, 'Quá khó'),
                _emojiFeedback(Icons.sentiment_neutral, 'Bình thường'),
                _emojiFeedback(Icons.sentiment_satisfied, 'Quá dễ'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emojiFeedback(IconData icon, String label) {
    final isSelected = selectedFeedback == label;
    return GestureDetector(
      onTap: () => _selectFeedback(label),
      child: Column(
        children: [
          Icon(icon,
              size: 70,
              color: isSelected ? AppColors.xanh_ngoc_nhat : Colors.grey),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _updateMetricsSection() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cập nhật chỉ số',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _metricInputField('Cân nặng', 'Kg')),
              const SizedBox(width: 10),
              Expanded(child: _metricInputField('Chiều cao', 'Cm')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _metricInputField('Nhịp tim', 'Bpm')),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

Widget _metricInputField(String label, String unit) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      suffixText: unit,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

Widget _infoCard(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.xanh_ngoc_nhat,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    ],
  );
}
