import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se215_nutrifit/common/widgets/button/sizedbutton.dart';
import 'package:se215_nutrifit/core/configs/constants/app_info.dart';

import '../../../core/configs/theme/app_colors.dart';
import 'target.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Nguyễn Duy Hưng',
  );
  final TextEditingController _ageController = TextEditingController(
    text: '20',
  );
  final TextEditingController _heightController = TextEditingController(
    text: '170',
  );
  final TextEditingController _weightController = TextEditingController(
    text: '60',
  );

  String _selectedIntensity = "Mạnh";
  String _selectedTime = "10 phút"; // Add this line
  String _selectedSpace = "Rộng"; // Add this line
  String _selectedEquipment = "Hạn chế"; // Add this line
  String _selectedBudget = "Dưới 50000đ"; // Update this line
  String _selectedCookingTime = "Dưới 30 phút"; // Add this line
  List<String> _selectedFoods = []; // Add this line
  List<String> _allergicFoods = []; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kế hoạch',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.xanh_ngoc_dam)),
      ),
      backgroundColor: AppColors.xam_nhat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            caNhan(
                nameController: _nameController,
                ageController: _ageController,
                weightController: _weightController,
                heightController: _heightController),
            const SizedBox(height: 10),
            const mucTieu(),
            const SizedBox(height: 10),
            luyenTap(
              selectedIntensity: _selectedIntensity,
              onIntensityChanged: (value) {
                setState(() {
                  _selectedIntensity = value!;
                });
              },
              selectedTime: _selectedTime, // Add this line
              onTimeChanged: (value) {
                setState(() {
                  _selectedTime = value!;
                });
              },
              selectedSpace: _selectedSpace, // Add this line
              onSpaceChanged: (value) {
                setState(() {
                  _selectedSpace = value!;
                });
              },
              selectedEquipment: _selectedEquipment, // Add this line
              onEquipmentChanged: (value) {
                setState(() {
                  _selectedEquipment = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            dinhDuong(
              selectedBudget: _selectedBudget, // Add this line
              onBudgetChanged: (value) {
                setState(() {
                  _selectedBudget = value!;
                });
              },
              selectedCookingTime: _selectedCookingTime, // Add this line
              onCookingTimeChanged: (value) {
                setState(() {
                  _selectedCookingTime = value!;
                });
              },
              selectedFoods: _selectedFoods, // Add this line
              onFoodsChanged: (value) {
                setState(() {
                  _selectedFoods = value;
                });
              },
              allergicFoods: _allergicFoods, // Add this line
              onAllergicFoodsChanged: (value) {
                setState(() {
                  _allergicFoods = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class caNhan extends StatelessWidget {
  const caNhan({
    super.key,
    required TextEditingController nameController,
    required TextEditingController ageController,
    required TextEditingController weightController,
    required TextEditingController heightController,
  })  : _nameController = nameController,
        _ageController = ageController,
        _weightController = weightController,
        _heightController = heightController;

  final TextEditingController _nameController;
  final TextEditingController _ageController;
  final TextEditingController _weightController;
  final TextEditingController _heightController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cá nhân',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên',
                labelStyle:
                    TextStyle(fontSize: 14), // Adjust the font size here
              ),
              controller: _nameController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tuổi',
              ),
              controller: _ageController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cân nặng',
              ),
              controller: _weightController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Chiều cao',
              ),
              controller: _heightController,
              style: const TextStyle(fontSize: 14), // Adjust the font size here
            ),
            const SizedBox(height: 13),
            Sizedbutton(
              onPressFun: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Xác nhận'),
                      content: const Text(
                          'Bạn có chắc chắn muốn cập nhật thông tin?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Hủy'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform the update action here
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Xác nhận'),
                        ),
                      ],
                    );
                  },
                );
              },
              text: 'Cập nhật',
              width: double.infinity,
              backgroundColor: Colors.white,
              textColor: AppColors.xanh_ngoc_nhat,
              isStroke: true,
              StrokeColor: AppColors.xanh_ngoc_nhat,
            ),
          ],
        ),
      ),
    );
  }
}

class mucTieu extends StatelessWidget {
  const mucTieu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mục tiêu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const Text(
              'Thời gian: 3 tháng',
              style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đạt 70kg',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Text(
                  'Hiện tại 84kg',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
              ],
            ),
            Slider(
              value: 0.5,
              onChanged: (value) {},
              activeColor: AppColors.xanh_ngoc_nhat,
            ),
            Sizedbutton(
              onPressFun: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Target(),
                  ),
                );
              },
              text: 'Chi tiết',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class luyenTap extends StatelessWidget {
  final String selectedIntensity;
  final ValueChanged<String?> onIntensityChanged;
  final String selectedTime; // Add this line
  final ValueChanged<String?> onTimeChanged; // Add this line
  final String selectedSpace; // Add this line
  final ValueChanged<String?> onSpaceChanged; // Add this line
  final String selectedEquipment; // Add this line
  final ValueChanged<String?> onEquipmentChanged; // Add this line

  const luyenTap({
    super.key,
    required this.selectedIntensity,
    required this.onIntensityChanged,
    required this.selectedTime, // Add this line
    required this.onTimeChanged, // Add this line
    required this.selectedSpace, // Add this line
    required this.onSpaceChanged, // Add this line
    required this.selectedEquipment, // Add this line
    required this.onEquipmentChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chế độ tập luyện',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cường độ tập luyện',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "Mạnh",
                        child: Text("Mạnh",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Trung bình",
                        child: Text("Trung bình",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Nhẹ",
                        child: Text("Nhẹ",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                  ],
                  onChanged: onIntensityChanged,
                  value: selectedIntensity,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thời gian luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "10 phút",
                        child: Text("10 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "15 phút",
                        child: Text("15 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "20 phút",
                        child: Text("20 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "25 phút",
                        child: Text("25 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "30 phút",
                        child: Text("30 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "35 phút",
                        child: Text("35 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "40 phút",
                        child: Text("40 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "45 phút",
                        child: Text("45 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "50 phút",
                        child: Text("50 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "55 phút",
                        child: Text("55 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                      value: "60 phút",
                      child: Text("60 phút",
                          style: TextStyle(
                              fontSize: 14, color: AppColors.xam_thuong)),
                    )
                  ],
                  onChanged: onTimeChanged,
                  value: selectedTime, // Add this line
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Không gian luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "Rộng",
                        child: Text("Rộng",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Trung bình",
                        child: Text("Trung bình",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Hạn chế",
                        child: Text("Hạn chế",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                  ],
                  onChanged: onSpaceChanged,
                  value: selectedSpace, // Add this line
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dụng cụ luyện tập',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "Đa dạng",
                        child: Text("Đa dạng",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Cơ bản",
                        child: Text("Cơ bản",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Hạn chế",
                        child: Text("Hạn chế",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                  ],
                  onChanged: onEquipmentChanged,
                  value: selectedEquipment, // Add this line
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chấn thương',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title:
                                    const Text('Chọn các chấn thương hiện tại'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Xác nhận'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Icon(Icons.add_rounded))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đầu gối phải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tay phải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bệnh lý nền',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title:
                                    const Text('Chọn các bệnh lý nền hiện tại'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('Xác nhận'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Icon(Icons.add_rounded))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Viêm phổi',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hở van tim',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class dinhDuong extends StatelessWidget {
  final String selectedBudget; // Add this line
  final ValueChanged<String?> onBudgetChanged; // Add this line
  final String selectedCookingTime; // Add this line
  final ValueChanged<String?> onCookingTimeChanged; // Add this line
  final List<String> selectedFoods; // Add this line
  final ValueChanged<List<String>> onFoodsChanged; // Add this line
  final List<String> allergicFoods; // Add this line
  final ValueChanged<List<String>> onAllergicFoodsChanged; // Add this line

  const dinhDuong({
    super.key,
    required this.selectedBudget, // Add this line
    required this.onBudgetChanged, // Add this line
    required this.selectedCookingTime, // Add this line
    required this.onCookingTimeChanged, // Add this line
    required this.selectedFoods, // Add this line
    required this.onFoodsChanged, // Add this line
    required this.allergicFoods, // Add this line
    required this.onAllergicFoodsChanged, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.xam_nhat,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppInfo.main_padding, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chế độ dinh dưỡng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.xanh_ngoc_dam,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ngân sách mỗi bữa ăn',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "Dưới 50000đ",
                        child: Text("Dưới 50000đ",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Dưới 150000đ",
                        child: Text("Dưới 150000đ",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Trên 150000đ",
                        child: Text("Trên 150000đ",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                  ],
                  onChanged: onBudgetChanged,
                  value: selectedBudget, // Add this line
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thời gian nấu',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                        value: "Dưới 15 phút",
                        child: Text("Dưới 15 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Dưới 30 phút",
                        child: Text("Dưới 30 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Dưới 45 phút",
                        child: Text("Dưới 45 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                    DropdownMenuItem(
                        value: "Dưới 60 phút",
                        child: Text("Dưới 60 phút",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.xam_thuong))),
                  ],
                  onChanged: onCookingTimeChanged,
                  value: selectedCookingTime, // Add this line
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thực phẩm yêu thích',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                IconButton(
                  icon: const Icon(Icons.add_rounded),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text('Chọn thực phẩm yêu thích'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text('Gà'),
                                      value: selectedFoods.contains('Gà'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Gà');
                                          } else {
                                            selectedFoods.remove('Gà');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Rau cải'),
                                      value: selectedFoods.contains('Rau cải'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Rau cải');
                                          } else {
                                            selectedFoods.remove('Rau cải');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Cá'),
                                      value: selectedFoods.contains('Cá'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Cá');
                                          } else {
                                            selectedFoods.remove('Cá');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Thịt bò'),
                                      value: selectedFoods.contains('Thịt bò'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Thịt bò');
                                          } else {
                                            selectedFoods.remove('Thịt bò');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Thịt lợn'),
                                      value: selectedFoods.contains('Thịt lợn'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Thịt lợn');
                                          } else {
                                            selectedFoods.remove('Thịt lợn');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Tôm'),
                                      value: selectedFoods.contains('Tôm'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Tôm');
                                          } else {
                                            selectedFoods.remove('Tôm');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Cua'),
                                      value: selectedFoods.contains('Cua'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Cua');
                                          } else {
                                            selectedFoods.remove('Cua');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Mực'),
                                      value: selectedFoods.contains('Mực'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Mực');
                                          } else {
                                            selectedFoods.remove('Mực');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Trứng'),
                                      value: selectedFoods.contains('Trứng'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Trứng');
                                          } else {
                                            selectedFoods.remove('Trứng');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Sữa'),
                                      value: selectedFoods.contains('Sữa'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFoods.add('Sữa');
                                          } else {
                                            selectedFoods.remove('Sữa');
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Hủy'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onFoodsChanged(selectedFoods);
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gà',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rau cải',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thực phẩm dị ứng',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.xam_thuong),
                ),
                IconButton(
                  icon: const Icon(Icons.add_rounded),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: const Text('Chọn thực phẩm dị ứng'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      title: const Text('Gà'),
                                      value: allergicFoods.contains('Gà'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Gà');
                                          } else {
                                            allergicFoods.remove('Gà');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Rau cải'),
                                      value: allergicFoods.contains('Rau cải'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Rau cải');
                                          } else {
                                            allergicFoods.remove('Rau cải');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Cá'),
                                      value: allergicFoods.contains('Cá'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Cá');
                                          } else {
                                            allergicFoods.remove('Cá');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Thịt bò'),
                                      value: allergicFoods.contains('Thịt bò'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Thịt bò');
                                          } else {
                                            allergicFoods.remove('Thịt bò');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Thịt lợn'),
                                      value: allergicFoods.contains('Thịt lợn'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Thịt lợn');
                                          } else {
                                            allergicFoods.remove('Thịt lợn');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Tôm'),
                                      value: allergicFoods.contains('Tôm'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Tôm');
                                          } else {
                                            allergicFoods.remove('Tôm');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Cua'),
                                      value: allergicFoods.contains('Cua'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Cua');
                                          } else {
                                            allergicFoods.remove('Cua');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Mực'),
                                      value: allergicFoods.contains('Mực'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Mực');
                                          } else {
                                            allergicFoods.remove('Mực');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Trứng'),
                                      value: allergicFoods.contains('Trứng'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Trứng');
                                          } else {
                                            allergicFoods.remove('Trứng');
                                          }
                                        });
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text('Sữa'),
                                      value: allergicFoods.contains('Sữa'),
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            allergicFoods.add('Sữa');
                                          } else {
                                            allergicFoods.remove('Sữa');
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Hủy'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    onAllergicFoodsChanged(allergicFoods);
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Xác nhận'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tôm',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cua',
                  style: TextStyle(fontSize: 14, color: AppColors.xam_thuong),
                ),
                Icon(Icons.remove)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
