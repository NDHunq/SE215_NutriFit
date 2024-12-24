import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Streak Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                ),
                child: Row(
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3 ngày liên tục',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.xanh_ngoc_dam),
                        ),
                        Text('Bạn đã tập thể dục 7 lần trong tuần này',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_right_outlined,
                        color: AppColors.xanh_ngoc_nhat,
                      ),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),

              // Custom Workout Mode
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chế độ luyện tập',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.xanh_ngoc_dam),
                        ),
                        Text(
                          'Tùy chỉnh chế độ luyện tập của bạn',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Xây dựng',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.xanh_ngoc_nhat,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),

              // Weekly Schedule
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border:
                      Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      pickWeek(week: "Tuần này"),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                          day: 'Thứ 2',
                          status: 'Chưa hoàn thành',
                          isCompleted: false),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                          day: 'Thứ 3',
                          status: 'Đã hoàn thành',
                          isCompleted: true),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                          day: 'Hôm nay',
                          status: '10 động tác - 10 phút - 500 calo',
                          isToday: true),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                        day: 'Thứ 5',
                        status: 'Nghỉ ngơi',
                        isCompleted: false,
                        beforeToday: true,
                      ),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                        day: 'Thứ 6',
                        status: '10 động tác - 10 phút - 500 calo',
                        isCompleted: false,
                        beforeToday: true,
                      ),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                        day: 'Thứ 7',
                        status: '10 động tác - 10 phút - 500 calo',
                        isCompleted: false,
                        beforeToday: true,
                      ),
                      SizedBox(height: 8.0),
                      WorkoutDayWidget(
                        day: 'Chủ nhật',
                        status: '10 động tác - 10 phút - 500 calo',
                        isCompleted: false,
                        beforeToday: true,
                      ),
                    ],
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

class pickWeek extends StatelessWidget {
  final String week;

  const pickWeek({
    required this.week,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 249, 249),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(children: [
          Text(week,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16)),
          Spacer(),
          IconButton(
            icon: const Icon(
              Icons.calendar_today,
              color: AppColors.xanh_ngoc_nhat,
            ),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ]),
      ),
    );
  }
}

class WorkoutDayWidget extends StatelessWidget {
  final String day;
  final String status;
  final bool isToday;
  final bool isCompleted;
  final bool beforeToday;

  const WorkoutDayWidget({
    required this.day,
    required this.status,
    this.isToday = false,
    this.isCompleted = false,
    this.beforeToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isToday ? Color(0xffE9F6F6) : Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: isToday ? AppColors.xanh_ngoc_nhat : const Color(0xFFE0E0E0),
            width: 1.0),
      ),
      child: ListTile(
        title: Text(
          day,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: (isCompleted)
                  ? AppColors.xanh_ngoc_nhat
                  : (isToday)
                      ? AppColors.xanh_ngoc_dam
                      : !beforeToday
                          ? AppColors.xam_thuong
                          : Colors.black),
        ),
        subtitle: Text(status,
            style: TextStyle(
              color: (isCompleted || isToday)
                  ? AppColors.xanh_ngoc_nhat
                  : AppColors.xam_thuong,
            )),
        trailing: isToday
            ? const Icon(Icons.chevron_right, color: AppColors.xanh_ngoc_nhat)
            : isCompleted
                ? const Icon(Icons.check, color: AppColors.xanh_ngoc_nhat)
                : !beforeToday
                    ? const Icon(Icons.close, color: AppColors.xam_thuong)
                    : null,
      ),
    );
  }
}
