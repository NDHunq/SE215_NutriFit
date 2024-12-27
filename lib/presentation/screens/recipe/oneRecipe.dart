import 'package:flutter/material.dart';
import 'package:se215_nutrifit/data/models/buoi.dart';

import '../../../common/widgets/card/buoiCard.dart';
import '../../../core/configs/theme/app_colors.dart';

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
              leading: Icon(
                Icons.account_circle_sharp,
                size: 40,
              ),
            ),
            const SizedBox(height: 10),
            const foodCard(),
            const foodCard(),
            const foodCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.xam_thuong,
                    width: 1,
                  ),
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
                            child: Icon(Icons.account_circle_sharp, size: 40),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Nhập bình luận',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
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
                      const cmt(),
                      const cmt(),
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
              child: Icon(Icons.account_circle_sharp, size: 40)),
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
  const foodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: ListTile(
          title: const Text(
            'Bánh mì',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.xanh_ngoc_dam,
            ),
          ),
          subtitle: const Text(
            '200 kcal',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.xam_thuong,
            ),
          ),
          leading: Container(
              width: 70,
              height: 70,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/album2.jpg',
                    fit: BoxFit.fitHeight,
                  ))),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
