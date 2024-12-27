import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/startScreen.dart';
import 'package:se215_nutrifit/presentation/screens/workout/workoutPage.dart';

class PreExerciseScreen extends StatefulWidget {
  @override
  State<PreExerciseScreen> createState() => _PreExerciseScreenState();
}

class _PreExerciseScreenState extends State<PreExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WorkoutPage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XffE9F6F6),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0XffE9F6F6),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Thứ 4",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.xanh_ngoc_dam)),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("10 ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.xanh_ngoc_nhat,
                                            fontWeight: FontWeight.bold)),
                                    Text("Động tác ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54)),
                                  ],
                                ),
                                SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("10 ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.xanh_ngoc_nhat,
                                            fontWeight: FontWeight.bold)),
                                    Text("Phút",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54)),
                                  ],
                                ),
                                SizedBox(width: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("100 ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.xanh_ngoc_nhat,
                                            fontWeight: FontWeight.bold)),
                                    Text("Calo",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Material(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: ListTile(
                    title: const Text("Cài đặt luyện tập",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.xanh_ngoc_dam)),
                    subtitle: const Text(
                      "Âm nhạc & Huấn luyện viên & Bộ hẹn giờ,...",
                      style: TextStyle(color: AppColors.xam_thuong),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const Text(
                        "Bài tập",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.xanh_ngoc_dam),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: MediaQuery.of(context).size.height - 395,
                        child: const SingleChildScrollView(
                          child: Column(
                            children: [
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                              ex(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XffE9F6F6),
                        side: const BorderSide(color: AppColors.xanh_ngoc_nhat),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Bắt đầu",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.xanh_ngoc_nhat)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ex extends StatelessWidget {
  const ex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Material(
            child: ListTile(
              tileColor: Colors.white,
              leading: Image.asset(
                "assets/images/ani.gif",
                height: 125.0,
                width: 80.0,
              ),
              title: Text("Gập người",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text("00:20"),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            height: 0,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
