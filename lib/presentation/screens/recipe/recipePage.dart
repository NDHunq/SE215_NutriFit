import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';

class RecipePage extends StatefulWidget {
  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinh dưỡng'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.xam_thuong,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chế độ ăn',
                      style: TextStyle(
                        fontSize: 20,
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
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Sizedbutton(
                      text: 'Xây dựng',
                      onPressFun: () {},
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
                border: Border.all(
                  color: AppColors.xam_thuong,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thực đơn tuần này',
                      style: TextStyle(
                        fontSize: 18,
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
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '11 nguyên liệu',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Sizedbutton(
                      text: 'Xem chi tiết',
                      onPressFun: () {},
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
                border: Border.all(
                  color: AppColors.xam_thuong,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Column(
                children: [
                  Align(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '150 Kcal',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '3 bữa',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        '200.000 đ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buoi(
                    buoi: 'Sáng',
                    kcal: 200,
                    time: 5,
                    price: 50000,
                  ),
                  SizedBox(height: 10),
                  _buoi(
                    buoi: 'Sáng',
                    kcal: 200,
                    time: 5,
                    price: 50000,
                  ),
                  SizedBox(height: 10),
                  _buoi(
                    buoi: 'Sáng',
                    kcal: 200,
                    time: 5,
                    price: 50000,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.xam_thuong,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tìm hiểu thêm các thực đơn do chúng tôi chuẩn bị',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.xanh_ngoc_dam,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Sizedbutton(
                      text: 'Khám phá',
                      onPressFun: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buoi extends StatefulWidget {
  final String buoi;
  final int kcal;
  final int time;
  final int price;

  const _buoi({
    super.key,
    required this.buoi,
    required this.kcal,
    required this.time,
    required this.price,
  });

  @override
  State<_buoi> createState() => _buoiState();
}

class _buoiState extends State<_buoi> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    String buoii = "";
    if (widget.buoi == "Sáng") {
      buoii = " (5 - 8 am)";
    } else if (widget.buoi == "Trưa") {
      buoii = " (11 - 13 am)";
    } else if (widget.buoi == "Chiều") {
      buoii = " (17 - 19 pm)";
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: isExpanded
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.xam_nhat,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.buoi,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.xanh_ngoc_dam,
                                  ),
                                ),
                                TextSpan(
                                  text: buoii.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.xam_thuong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(widget.kcal.toString() + ' Kcal',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                            const SizedBox(width: 15),
                            Text(widget.time.toString() + ' phút chế biến',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                            const SizedBox(width: 15),
                            Text(widget.price.toString() + ' đ',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CarouselSlider(
                            options:
                                CarouselOptions(height: 150.0, autoPlay: true),
                            items: [1, 2, 3, 4, 5].map((index) {
                              final String img =
                                  'assets/images/album$index.jpg';
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(img),
                                            fit: BoxFit.cover),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Sizedbutton(
                          onPressFun: () {},
                          text: "Yêu thích",
                          width: double.infinity,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.xam_nhat,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.buoi,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.xanh_ngoc_dam,
                                  ),
                                ),
                                TextSpan(
                                  text: buoii.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.xam_thuong,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(widget.kcal.toString() + ' Kcal',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                            const SizedBox(width: 15),
                            Text(widget.time.toString() + ' phút chế biến',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                            const SizedBox(width: 15),
                            Text(widget.price.toString() + ' đ',
                                style: const TextStyle(
                                    color: AppColors.xam_thuong)),
                          ],
                        )
                      ],
                    ),
                    const Icon(
                      Icons.favorite_rounded,
                      color: AppColors.xanh_ngoc_nhat,
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
