import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/data/models/buoi.dart';
import '../../../common/widgets/card/buoiCard.dart';
import '../plan/planPage.dart';
import 'weekRecipe.dart';

class RecipePage extends StatefulWidget {
  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinh dưỡng',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 010.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Chế độ ăn',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.xanh_ngoc_dam,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cá nhân hóa thực đơn của bạn',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.xam_thuong,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Sizedbutton(
                        text: 'Xây dựng',
                        onPressFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlanPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Thực đơn tuần này',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.xanh_ngoc_dam,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '220.000 đ',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.xam_thuong,
                          ),
                        ),
                        Text(
                          '11 nguyên liệu',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.xam_thuong,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Sizedbutton(
                        text: 'Xem chi tiết',
                        onPressFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeekRecipe(),
                            ),
                          );
                        },
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gợi ý cho thực đơn hôm nay',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.xanh_ngoc_dam,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '270 Kcal',
                        style: TextStyle(
                          color: AppColors.xanh_ngoc_nhat,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          '3 bữa',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '120.000 đ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Buoi(
                      buoi: BuoiModel(
                        buoi: 'Sáng',
                        kcal: 50,
                        time: 15,
                        price: 50000,
                      ),
                    ),
                    Buoi(
                      buoi: BuoiModel(
                        buoi: 'Trưa',
                        kcal: 100,
                        time: 20,
                        price: 30000,
                      ),
                    ),
                    Buoi(
                      buoi: BuoiModel(
                        buoi: 'Tối',
                        kcal: 120,
                        time: 25,
                        price: 40000,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecipePage(),
  ));
}
