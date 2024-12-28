import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/plan/planPage.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/preExercise.dart';
import 'package:se215_nutrifit/presentation/screens/workout/historyPage.dart';

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryPage()),
                        );
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
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_right_outlined,
                        color: AppColors.xanh_ngoc_nhat,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlanPage()),
                        );
                      },
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

class pickWeek extends StatefulWidget {
  final String week;

  const pickWeek({required this.week});

  @override
  _pickWeekState createState() => _pickWeekState();
}

class _pickWeekState extends State<pickWeek> {
  String displayedWeek = "Tuần này";

  @override
  void initState() {
    super.initState();
    displayedWeek = widget.week; // Khởi tạo giá trị tuần mặc định
  }

  Future<void> _selectWeek(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      DateTime pickedFirstDay =
          picked.subtract(Duration(days: picked.weekday - 1));
      DateTime pickedLastDay = pickedFirstDay.add(const Duration(days: 6));

      setState(() {
        if (pickedFirstDay.isBefore(now) && pickedLastDay.isAfter(now)) {
          displayedWeek = "Tuần này";
        } else {
          displayedWeek =
              "${_formatDate(pickedFirstDay)} - ${_formatDate(pickedLastDay)}";
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 249, 249),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Text(
              displayedWeek,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.calendar_today,
                color: AppColors.xanh_ngoc_nhat,
              ),
              onPressed: () => _selectWeek(context),
            ),
          ],
        ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PreExerciseScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              isToday ? Color(0xffE9F6F6) : Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color:
                  isToday ? AppColors.xanh_ngoc_nhat : const Color(0xFFE0E0E0),
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
      ),
    );
  }
}
