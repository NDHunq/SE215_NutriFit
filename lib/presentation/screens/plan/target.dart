import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/core/configs/constants/app_info.dart';

import '../../../core/configs/theme/app_colors.dart';

class Target extends StatefulWidget {
  const Target({super.key});

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  String _selectedTime = "Nhanh"; // Add this line
  String _selectedTarget = "Đạt được"; // Add this line

  void _onTimeChanged(String? value) {
    // Add this line
    setState(() {
      _selectedTime = value!;
    });
  }

  void _onTargetChanged(String? value) {
    // Add this line
    setState(() {
      _selectedTarget = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mục tiêu',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      backgroundColor: AppColors.xam_nhat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            luyenTap(
              selectedTime: _selectedTime, // Add this line
              onTimeChanged: _onTimeChanged, // Add this line
              selectedTarget: _selectedTarget, // Add this line
              onTargetChanged: _onTargetChanged, // Add this line
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppInfo.main_padding),
              child: Text("Lịch sử",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.xanh_ngoc_dam)),
            ),
            const SizedBox(height: 8),
            lichSu(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class luyenTap extends StatelessWidget {
  final String selectedTime; // Add this line
  final ValueChanged<String?> onTimeChanged; // Add this line
  final String selectedTarget; // Add this line
  final ValueChanged<String?> onTargetChanged; // Add this line

  const luyenTap({
    super.key,
    required this.selectedTime, // Add this line
    required this.onTimeChanged, // Add this line
    required this.selectedTarget, // Add this line
    required this.onTargetChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              RadioListTile(
                title: const Text('Đạt được'),
                value: 'Đạt được',
                groupValue: selectedTarget, // Update this line
                onChanged: onTargetChanged, // Update this line
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppInfo.main_padding),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: '70',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('kg'),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppInfo.main_padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Thời gian hoàn thành",
                      style: TextStyle(color: AppColors.xam_thuong),
                    ),
                    DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(
                            value: "Nhanh",
                            child: Text("Nhanh",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.xam_thuong))),
                        DropdownMenuItem(
                            value: "Trung bình",
                            child: Text("Trung bình",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.xam_thuong))),
                        DropdownMenuItem(
                            value: "Nhẹ",
                            child: Text("Nhẹ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.xam_thuong))),
                      ],
                      onChanged: onTimeChanged,
                      value: selectedTime,
                    )
                  ],
                ),
              ),
              RadioListTile(
                title: const Text('Giảm tỉ lệ mỡ'),
                value: 'Giảm tỉ lệ mỡ',
                groupValue: selectedTarget, // Update this line
                onChanged: onTargetChanged, // Update this line
              ),
              RadioListTile(
                title: const Text('Tăng sức bền'),
                value: 'Tăng sức bền',
                groupValue: selectedTarget, // Update this line
                onChanged: onTargetChanged, // Update this line
              ),
              RadioListTile(
                title: const Text('Tăng cường cơ bắp'),
                value: 'Tăng cường cơ bắp',
                groupValue: selectedTarget, // Update this line
                onChanged: onTargetChanged, // Update this line
              ),
              RadioListTile(
                title: const Text('Sống lành mạnh'),
                value: 'Sống lành mạnh',
                groupValue: selectedTarget, // Update this line
                onChanged: onTargetChanged, // Update this line
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppInfo.main_padding, vertical: 10),
            child: Sizedbutton(
              onPressFun: () {},
              text: 'Lưu',
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class lichSu extends StatelessWidget {
  const lichSu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "11/11/2024 - 12/12/2204",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Đạt 70kg",
                  style: TextStyle(
                    color: AppColors.xanh_ngoc_nhat,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Thời gian: 3 tháng",
                  style: TextStyle(
                    color: AppColors.xam_thuong,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.check_circle_outline,
              size: 45,
              color: AppColors.xanh_ngoc_nhat,
            ),
          ],
        ),
      ),
    );
  }
}
