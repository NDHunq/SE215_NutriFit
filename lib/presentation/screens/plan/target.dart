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
            luyenTap(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              RadioListTile(
                title: const Text('Đạt được'),
                value: 'Đạt được',
                groupValue: 'target',
                onChanged: (value) {},
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppInfo.main_padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Thời gian hoàn thành",
                      style: TextStyle(color: AppColors.xam_thuong),
                    ),
                    Text(
                      "Nhanh   >",
                      style: TextStyle(color: AppColors.xam_thuong),
                    )
                  ],
                ),
              ),
              RadioListTile(
                title: const Text('Giảm tỉ lệ mỡ'),
                value: 'Giảm tỉ lệ mỡ',
                groupValue: 'target',
                onChanged: (value) {},
              ),
              RadioListTile(
                title: const Text('Tăng sức bền'),
                value: 'Tăng sức bền',
                groupValue: 'target',
                onChanged: (value) {},
              ),
              RadioListTile(
                title: const Text('Tăng cường cơ bắp'),
                value: 'Tăng cường cơ bắp',
                groupValue: 'target',
                onChanged: (value) {},
              ),
              RadioListTile(
                title: const Text('Sống lành mạnh'),
                value: 'Sống lành mạnh',
                groupValue: 'target',
                onChanged: (value) {},
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
