import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:se215_nutrifit/presentation/screens/recipe/oneRecipe.dart';
import 'package:se215_nutrifit/presentation/screens/workout/exercise/preExercise.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_chart/flutter_chart.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch sử"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: "Lịch"),
            const Tab(text: "Thời lượng"),
            const Tab(text: "Calo"),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 380,
            child: TabBarView(
              controller: _tabController,
              children: [
                HistoryTab(), // Tab "Lịch"
                TimeTab(), // Tab "Thời lượng"
                CaloTab(), // Tab "Calo"
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Lịch sử hàng tuần",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.xanh_ngoc_dam,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phần tiêu đề và thông tin ngắn gọn
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "22 Th12 - 28 Th12",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "1 lần tập   1 công thức yêu thích",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Phần danh sách chi tiết
                    const Column(
                      children: [
                        HistoryDetailItem(
                          icon: Icons.local_fire_department,
                          title: "Luyện tập ngày 23/12",
                          subtitle: "10 động tác - 10 phút - 500 calo",
                          type: 1,
                        ),
                        SizedBox(height: 8),
                        HistoryDetailItem(
                          icon: Icons.favorite,
                          title: "Bữa sáng kiểu anh",
                          subtitle: "Nguyễn Văn A",
                          type: 2,
                        ),
                      ],
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

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late Map<DateTime, List> _events;
  late List<DateTime> _highlightedDays;

  @override
  void initState() {
    super.initState();
    _highlightedDays = [
      DateTime.now().subtract(const Duration(days: 2)),
      DateTime.now().subtract(const Duration(days: 1)),
      DateTime.now(),
      DateTime.now().add(const Duration(days: 1)),
      DateTime(2024, 11, 23),
    ];
    _events = {
      for (var day in _highlightedDays) day: ['Event 1'],
      DateTime(2024, 11, 23): ['Special Event'], // Thêm sự kiện ngày 23/11
    };
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border(),
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.xanh_ngoc_nhat, // Color for the selected date
          shape: BoxShape.circle,
        ),
        markersMaxCount: 1,
        markersAlignment: Alignment.bottomCenter,
        markersOffset: PositionedOffset(bottom: 5),
        markerDecoration: BoxDecoration(
          color: AppColors.xanh_ngoc_nhat,
          shape: BoxShape.rectangle,
        ),
      ),
      selectedDayPredicate: (day) {
        // Highlight 23rd November
        return day.day == 23 && day.month == 12;
      },
      eventLoader: (day) {
        return _events[day] ?? [];
      },
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
    );
  }
}

class TimeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ChartBar(
        size:
            Size(MediaQuery.of(context).size.width, 300), // Kích thước biểu đồ
        chartBeans: _chartData(), // Cung cấp dữ liệu cho biểu đồ
        rectColor: Colors.teal, // Màu của cột
        duration: const Duration(milliseconds: 800), // Thời gian animation
        fontSize: 12, // Kích thước chữ
        fontColor: Colors.black, // Màu chữ
        isShowX: true, // Hiển thị trục X
        isShowTouchValue: true, // Hiển thị giá trị khi chạm vào
      ),
    );
  }

  // Cung cấp dữ liệu cho biểu đồ
  List<ChartBean> _chartData() {
    return [
      ChartBean(x: '22/12', y: 0),
      ChartBean(x: '23/12', y: 200),
      ChartBean(x: '24/12', y: 0),
      ChartBean(x: '25/12', y: 0),
      ChartBean(x: '26/12', y: 0),
      ChartBean(x: '27/12', y: 0),
      ChartBean(x: '28/12', y: 0),
    ];
  }
}

class CaloTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ChartBar(
        size:
            Size(MediaQuery.of(context).size.width, 300), // Kích thước biểu đồ
        chartBeans: _chartData(), // Cung cấp dữ liệu cho biểu đồ
        rectColor: Colors.teal, // Màu của cột
        duration: const Duration(milliseconds: 800), // Thời gian animation
        fontSize: 12, // Kích thước chữ
        fontColor: Colors.black, // Màu chữ
        isShowX: true, // Hiển thị trục X
        isShowTouchValue: true, // Hiển thị giá trị khi chạm vào
        // Hiển thị giá trị trên mỗi cột
      ),
    );
  }

  // Cung cấp dữ liệu cho biểu đồ
  List<ChartBean> _chartData() {
    return [
      ChartBean(x: '22/12', y: 0),
      ChartBean(x: '23/12', y: 200),
      ChartBean(x: '24/12', y: 0),
      ChartBean(x: '25/12', y: 0),
      ChartBean(x: '26/12', y: 0),
      ChartBean(x: '27/12', y: 0),
      ChartBean(x: '28/12', y: 0),
    ];
  }
}

class HistoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const HistoryItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Xử lý khi nhấn vào item
        },
      ),
    );
  }
}

class HistoryDetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int type;

  const HistoryDetailItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PreExerciseScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OneRecipe()),
          );
        }
      },
      child: Row(
        children: [
          // Biểu tượng bên trái
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.teal[100], // Màu nền icon
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.teal),
          ),
          const SizedBox(width: 16),
          // Nội dung bên phải
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios,
              size: 16, color: Colors.teal), // Mũi tên
        ],
      ),
    );
  }
}
