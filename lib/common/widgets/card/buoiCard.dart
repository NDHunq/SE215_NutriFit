import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/data/models/buoi.dart';
import 'package:se215_nutrifit/presentation/screens/recipe/detailFood.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../presentation/screens/recipe/oneRecipe.dart';

class Buoi extends StatefulWidget {
  final BuoiModel buoi;
  final isHaveBackgroundColor;
  const Buoi({
    super.key,
    required this.buoi,
    this.isHaveBackgroundColor = true,
  });

  @override
  State<Buoi> createState() => BuoiState();
}

class BuoiState extends State<Buoi> {
  bool isExpanded = false;
  bool isFavorite = false;
  List<String> food = [
    "Cơm gạo lức",
    "Salad cá hồi",
    "Bún riêu",
    "Sữa chua hạt đác"
  ];
  @override
  Widget build(BuildContext context) {
    String buoii = "";
    if (widget.buoi.buoi == "Sáng") {
      buoii = " (5 - 8 am)";
    } else if (widget.buoi.buoi == "Trưa") {
      buoii = " (11 - 13 am)";
    } else if (widget.buoi.buoi == "Chiều") {
      buoii = " (17 - 19 pm)";
    }

    return GestureDetector(
      onTap: () {
        if (widget.isHaveBackgroundColor) {
          setState(() {
            isExpanded = !isExpanded;
          });
        }
      },
      child: isExpanded
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffE9F6F6),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE9F6F6),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: widget.buoi.buoi,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      AppColors.xanh_ngoc_dam,
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
                                          Text(
                                              widget.buoi.kcal.toString() +
                                                  ' Kcal',
                                              style: const TextStyle(
                                                  color: AppColors.xam_thuong)),
                                          const SizedBox(width: 15),
                                          Text(
                                              widget.buoi.time.toString() +
                                                  ' phút chế biến',
                                              style: const TextStyle(
                                                  color: AppColors.xam_thuong)),
                                          const SizedBox(width: 15),
                                          Text(
                                              widget.buoi.price.toString() +
                                                  ' đ',
                                              style: const TextStyle(
                                                  color: AppColors.xam_thuong)),
                                        ],
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: isFavorite
                                          ? AppColors.xanh_ngoc_nhat
                                          : AppColors.xam_thuong,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  height: 150.0, autoPlay: true),
                              items: [1, 2, 3, 4].map((index) {
                                final String img =
                                    'assets/images/album$index.jpg';
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailFood(),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(img),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                          ),
                                          Positioned(
                                            bottom: 15,
                                            right: 20,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                color: Colors.black
                                                    .withOpacity(0.55),
                                              ),
                                              child: Text(
                                                food[index - 1],
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                              onPressFun: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OneRecipe(),
                                  ),
                                );
                              },
                              text: "Xem chi tiết",
                              width: double.infinity,
                              backgroundColor: AppColors.xanh_ngoc_nhat)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.isHaveBackgroundColor
                      ? Color(0xffE9F6F6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.buoi.buoi,
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
                              Text(widget.buoi.kcal.toString() + ' Kcal',
                                  style: const TextStyle(
                                      color: AppColors.xam_thuong)),
                              const SizedBox(width: 15),
                              Text(
                                  widget.buoi.time.toString() +
                                      ' phút chế biến',
                                  style: const TextStyle(
                                      color: AppColors.xam_thuong)),
                              const SizedBox(width: 15),
                              Text(widget.buoi.price.toString() + ' đ',
                                  style: const TextStyle(
                                      color: AppColors.xam_thuong)),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite_rounded,
                          color: isFavorite
                              ? AppColors.xanh_ngoc_nhat
                              : AppColors.xam_thuong,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
