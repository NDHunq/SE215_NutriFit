import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:se215_nutrifit/common/widgets/card/buoiCard.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../data/models/buoi.dart';

class WeekRecipe extends StatefulWidget {
  const WeekRecipe({super.key});

  @override
  State<WeekRecipe> createState() => _WeekRecipeState();
}

class _WeekRecipeState extends State<WeekRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thực đơn tuần này',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  child: const Column(
                    children: [
                      Text('Nguyên liệu',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.xanh_ngoc_dam)),
                      _ingredientCard(
                        name: 'Thịt bò',
                        quantity: '2kg',
                        price: '200.000',
                        image:
                            'https://cdn.nhathuoclongchau.com.vn/unsafe/https://cms-prod.s3-sgn09.fptcloud.com/co_the_ban_chua_biet_cac_thanh_phan_dinh_duong_cua_thit_bo_AH_Sti_1673158022_65bd0ff812.png',
                      ),
                      _ingredientCard(
                        name: 'Cá hồi',
                        quantity: '1kg',
                        price: '150.000',
                        image:
                            'https://vcdn1-dulich.vnecdn.net/2013/10/12/kssapa-8211-1381544457.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=isajbMUnELAm-yapwILocw',
                      ),
                      _ingredientCard(
                        name: 'Ức gà',
                        quantity: '2kg',
                        price: '10.000',
                        image:
                            'https://thucphamsachgiagoc.com/wp-content/uploads/2018/12/uc-ga-phi-le.jpg',
                      ),
                      _ingredientCard(
                        name: 'Dầu olive',
                        quantity: '1 ',
                        price: '200.000',
                        image:
                            'https://gofood.vn/upload/r/san-pham/gia-vi-Y-tay-ban-nha/dau-oliu/dau-oliu-pomace-castello-250ml-3.jpg',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    children: [
                      const Text('Thực đơn',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.xanh_ngoc_dam)),
                      _thuCard(
                        name: 'Thứ 2',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(
                        name: 'Thứ 3',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Chiều',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(
                        name: 'Thứ 4',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Chiều',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(
                        name: 'Thứ 5',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Chiều',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(
                        name: 'Thứ 6',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Chiều',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(
                        name: 'Thứ 7',
                        price: '200.000đ',
                        buoi: [
                          BuoiModel(
                            buoi: 'Sáng',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Trưa',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                          BuoiModel(
                            buoi: 'Chiều',
                            kcal: 200,
                            time: 5,
                            price: 50000,
                          ),
                        ],
                      ),
                      _thuCard(name: 'Chủ nhật', price: '200.000đ', buoi: [
                        BuoiModel(
                          buoi: 'Sáng',
                          kcal: 200,
                          time: 5,
                          price: 50000,
                        ),
                        BuoiModel(
                          buoi: 'Trưa',
                          kcal: 200,
                          time: 5,
                          price: 50000,
                        ),
                        BuoiModel(
                          buoi: 'Chiều',
                          kcal: 200,
                          time: 5,
                          price: 50000,
                        ),
                      ]),
                    ],
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

class _thuCard extends StatefulWidget {
  final String name;
  final String price;
  final List<BuoiModel> buoi;
  const _thuCard({
    super.key,
    required this.name,
    required this.price,
    required this.buoi,
  });

  @override
  State<_thuCard> createState() => _thuCardState();
}

class _thuCardState extends State<_thuCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: isExpanded
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.xanh_ngoc_dam),
                        ),
                        ...widget.buoi.map((buoi) {
                          return Buoi(buoi: buoi);
                        }).toList(),
                        const ListTile(
                          title: Text(
                            '11 nguyên liệu',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "200.000đ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.xam_thuong),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Card(
                child: ListTile(
                  leading: Text(
                    widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.xanh_ngoc_dam),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.xam_thuong),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ));
  }
}

class _ingredientCard extends StatefulWidget {
  final String name;
  final String quantity;
  final String price;
  final String image;

  const _ingredientCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  @override
  State<_ingredientCard> createState() => _ingredientCardState();
}

class _ingredientCardState extends State<_ingredientCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.xanh_ngoc_dam),
        ),
        subtitle: Text(
          widget.price,
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: AppColors.xam_thuong),
        ),
        trailing: Text(
          widget.quantity,
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: AppColors.xam_thuong),
        ),
      ),
    );
  }
}
