import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

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
        title: Text("Lịch sử"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Lịch"),
            Tab(text: "Thời lượng"),
            Tab(text: "Calo"),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HistoryTab(), // Tab "Lịch"
                TimeTab(), // Tab "Thời lượng"
                Placeholder(), // Tab "Calo"
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phần tiêu đề và thông tin ngắn gọn
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "17 Th11 - 23 Th11",
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
                    SizedBox(height: 16),
                    // Phần danh sách chi tiết
                    Column(
                      children: [
                        HistoryDetailItem(
                          icon: Icons.local_fire_department,
                          title: "Luyện tập ngày 23/11",
                          subtitle: "10 động tác - 10 phút - 500 calo",
                        ),
                        SizedBox(height: 8),
                        HistoryDetailItem(
                          icon: Icons.favorite,
                          title: "Bữa sáng kiểu anh",
                          subtitle: "Nguyễn Văn A",
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
      DateTime.now().subtract(Duration(days: 2)),
      DateTime.now().subtract(Duration(days: 1)),
      DateTime.now(),
      DateTime.now().add(Duration(days: 1)),
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
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        markersMaxCount: 1,
        markersAlignment: Alignment.bottomCenter,
        markersOffset: PositionedOffset(bottom: 5),
        markerDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
        ),
      ),
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
    return Placeholder();
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
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
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

  const HistoryDetailItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Biểu tượng bên trái
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.teal[100], // Màu nền icon
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.teal),
        ),
        SizedBox(width: 16),
        // Nội dung bên phải
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
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
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal), // Mũi tên
      ],
    );
  }
}
