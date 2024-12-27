import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/core/configs/constants/app_info.dart';

import '../../../core/configs/theme/app_colors.dart';
import 'target.dart';

class PlanPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController(
    text: 'Nguyễn Duy Hưng',
  );
  TextEditingController _ageController = TextEditingController(
    text: '20',
  );
  TextEditingController _heightController = TextEditingController(
    text: '170',
  );
  TextEditingController _weightController = TextEditingController(
    text: '60',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kế hoạch',
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
              caNhan(
                  nameController: _nameController,
                  ageController: _ageController,
                  weightController: _weightController,
                  heightController: _heightController),
              const SizedBox(height: 10),
              const mucTieu(),
              const SizedBox(height: 10),
              const luyenTap(),
              const SizedBox(height: 10),
              dinhDuong(),
            ],
          ),
        ));
  }
}

class caNhan extends StatelessWidget {
  const caNhan({
    super.key,
    required TextEditingController nameController,
    required TextEditingController ageController,
    required TextEditingController weightController,
    required TextEditingController heightController,
  })  : _nameController = nameController,
        _ageController = ageController,
        _weightController = weightController,
        _heightController = heightController;

  final TextEditingController _nameController;
  final TextEditingController _ageController;
  final TextEditingController _weightController;
  final TextEditingController _heightController;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cá nhân',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên',
                labelStyle:
                    TextStyle(fontSize: 14), // Adjust the font size here
              ),
              controller: _nameController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tuổi',
              ),
              controller: _ageController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cân nặng',
              ),
              controller: _weightController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Chiều cao',
              ),
              controller: _heightController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            Sizedbutton(
              onPressFun: () {},
              text: 'Cập nhật',
              width: double.infinity,
              backgroundColor: Colors.white,
              textColor: AppColors.xanh_ngoc_nhat,
              isStroke: true,
              StrokeColor: AppColors.xanh_ngoc_nhat,
            ),
          ],
        ),
      ),
    );
  }
}

class mucTieu extends StatelessWidget {
  const mucTieu({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mục tiêu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const Text(
              'Thời gian: 3 tháng',
              style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đạt 70kg',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Text(
                  'Hiện tại 84kg',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
              ],
            ),
            Slider(
              value: 0.5,
              onChanged: (value) {},
              activeColor: AppColors.xanh_ngoc_nhat,
            ),
            Sizedbutton(
              onPressFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Target(),
                  ),
                );
              },
              text: 'Chi tiết',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class luyenTap extends StatelessWidget {
  const luyenTap({
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
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chế độ tập luyện',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cường độ tập luyện',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Row(
                  children: [
                    Text(
                      'Mạnh',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thời gian luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Row(
                  children: [
                    Text(
                      '10p',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Không gian luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Row(
                  children: [
                    Text(
                      'Rộng',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dụng cụ luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Row(
                  children: [
                    Text(
                      'Hạn chế',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chấn thương',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Icon(Icons.add_rounded)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đầu gối phải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tay phải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bệnh lý nền',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Icon(Icons.add_rounded)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Viêm phổi',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hở van tim',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class dinhDuong extends StatelessWidget {
  const dinhDuong({
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
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chế độ dinh dưỡng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ngân sách mỗi bữa ăn',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Text(
                  'Dưới 100000đ',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thời gian nấu',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Text(
                  'Dưới 30 phút',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thực phẩm yêu thích',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Icon(Icons.add_rounded)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gà',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rau cải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thực phẩm dị ứng',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                Icon(Icons.add_rounded)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tôm',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cua',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
