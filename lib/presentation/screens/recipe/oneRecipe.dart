import 'package:flutter/material.dart';
import 'package:se215_nutrifit/data/models/buoi.dart';

import '../../../common/widgets/card/buoiCard.dart';
import '../../../core/configs/theme/app_colors.dart';
import 'detailFood.dart';

class OneRecipe extends StatefulWidget {
  const OneRecipe({super.key});

  @override
  State<OneRecipe> createState() => _OneRecipeState();
}

class _OneRecipeState extends State<OneRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bữa sáng',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Buoi(
                buoi:
                    BuoiModel(buoi: "Sáng", kcal: 200, time: 12, price: 30000),
                isHaveBackgroundColor: false,
              ),
            ),
            const ListTile(
              title: Text(
                'Nguyễn Duy Hưng',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.xanh_ngoc_dam,
                ),
              ),
              leading: Image(image: AssetImage('assets/images/6858504.png')),
            ),
            const SizedBox(height: 10),
            foodCard(
                name: 'Cơm gạo lứt',
                kcal: '200 kcal',
                image: 'assets/images/album1.jpg'),
            foodCard(
                name: 'Salad cá hồi',
                kcal: '60 kcal',
                image: 'assets/images/album2.jpg'),
            foodCard(
                name: 'Bún riêu',
                kcal: '230 kcal',
                image: 'assets/images/album3.jpg'),
            foodCard(
                name: 'Sữa chua hạt đác',
                kcal: '100 kcal',
                image: 'assets/images/album4.jpg'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Bình luận",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.xanh_ngoc_dam)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Image(
                                image: AssetImage('assets/images/6858504.png'),
                                width: 40,
                                height: 40),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Nhập bình luận',
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.send,
                                    size: 23,
                                    color: AppColors.xanh_ngoc_nhat,
                                  ),
                                  onPressed: () {
                                    // Add your send button logic here
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const cmt(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text("5 phút",
                            style: TextStyle(
                                fontSize: 13, color: AppColors.xam_thuong)),
                      ),
                      const SizedBox(height: 5),
                      const cmt(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text("6 phút",
                            style: TextStyle(
                                fontSize: 13, color: AppColors.xam_thuong)),
                      ),
                      const SizedBox(height: 5),
                      const cmt(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text("15 phút",
                            style: TextStyle(
                                fontSize: 13, color: AppColors.xam_thuong)),
                      ),
                      const Divider(),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Xem thêm",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.xanh_ngoc_dam))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class cmt extends StatelessWidget {
  const cmt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Align(
              alignment: Alignment.topCenter,
              child: Image(
                  image: AssetImage('assets/images/6858504.png'),
                  width: 40,
                  height: 40)),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.xam_thuong,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyễn Duy Hưng',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.xanh_ngoc_dam,
                      ),
                    ),
                    Text(
                      "Cá hồi salad tuyệt vời! Miếng cá hồi tươi ngon, mềm mại",
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class foodCard extends StatelessWidget {
  String name;
  String kcal;
  String image;
  foodCard({
    required this.name,
    required this.kcal,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailFood(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          child: ListTile(
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            subtitle: Text(
              kcal,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.xam_thuong,
              ),
            ),
            leading: Container(
                width: 70,
                height: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ))),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailFood(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
