import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/constants/app_info.dart';

import '../../../core/configs/theme/app_colors.dart';

class DetailFood extends StatefulWidget {
  const DetailFood({super.key});

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salad cá hồi',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppInfo.main_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    '500 cal',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.xam_thuong,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '30 phút',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.xam_thuong,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/album1.jpg',
                        fit: BoxFit.fitHeight,
                      ))),
              const SizedBox(height: 10),
              const Text(
                'Nguyên liệu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.xanh_ngoc_dam,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1. Cá hồi\n2. Rau cải\n3. Dầu olive\n4. Hành tây',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.xam_thuong,
                    ),
                  ),
                  Text(
                    '300 gr\n200 gr\n100 gr\n150 gr',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.xam_thuong,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Cách chế biến',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.xanh_ngoc_dam,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.xanh_ngoc_dam),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Text("  Làm sạch cá hồi"),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album1.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                  const SizedBox(width: 10),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album2.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.xanh_ngoc_dam),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "2",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Text("  Sơ chế nguyên liệu, ướp cá"),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album3.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                  const SizedBox(width: 10),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album4.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.xanh_ngoc_dam),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "3",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "  Trộn các nguyên liệu với nhau, để nghỉ 30 phút và thưởng thức",
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album4.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                  const SizedBox(width: 10),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/album5.jpg',
                            fit: BoxFit.fitHeight,
                          ))),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
