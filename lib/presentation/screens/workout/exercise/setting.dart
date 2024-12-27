import 'package:flutter/material.dart';
import 'package:se215_nutrifit/core/configs/theme/app_colors.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isBackgroundMusicEnabled = true;
  bool isInstructionVoiceEnabled = true;
  bool isSoundEffectsEnabled = true;
  String selectedCoach = 'Huấn luyện viên 2D';
  String selectedLanguage = 'Tiếng Anh';
  String selectedCoachVoice = 'Giọng nam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cài đặt luyện tập',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Virtual Coach Selection
            ListTile(
              title: const Text(
                'Huấn luyện viên',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(selectedCoach),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Huấn luyện viên 2D'),
                          onTap: () {
                            setState(() {
                              selectedCoach = 'Huấn luyện viên 2D';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Huấn luyện viên 3D'),
                          onTap: () {
                            setState(() {
                              selectedCoach = 'Huấn luyện viên 3D';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Video'),
                          onTap: () {
                            setState(() {
                              selectedCoach = 'Video';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            // Background Music
            Column(
              children: [
                SwitchListTile(
                  title: const Text(
                    'Âm nhạc nền',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  value: isBackgroundMusicEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isBackgroundMusicEnabled = value;
                    });
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/avatar.png'), // Replace with your image asset
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên bài hát',
                        style: TextStyle(),
                      ),
                      Text('00:00',
                          style: TextStyle(
                              fontSize: 15, color: AppColors.xam_thuong)),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    // Handle tap
                  },
                ),
              ],
            ),
            const Divider(),
            // Instruction Voice
            SwitchListTile(
              title: const Text(
                'Giọng nói hướng dẫn',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: isInstructionVoiceEnabled,
              onChanged: (bool value) {
                setState(() {
                  isInstructionVoiceEnabled = value;
                });
              },
            ),
            ListTile(
              title: const Text(
                'Ngôn ngữ giọng nói',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(selectedLanguage),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Tiếng Anh'),
                          onTap: () {
                            setState(() {
                              selectedLanguage = 'Tiếng Anh';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Tiếng Việt'),
                          onTap: () {
                            setState(() {
                              selectedLanguage = 'Tiếng Việt';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            // Coach's Voice
            ListTile(
              title: const Text(
                'Giọng nói của huấn luyện viên',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(selectedCoachVoice),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Giọng nam'),
                          onTap: () {
                            setState(() {
                              selectedCoachVoice = 'Giọng nam';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Giọng nữ'),
                          onTap: () {
                            setState(() {
                              selectedCoachVoice = 'Giọng nữ';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Divider(),
            // Sound Effects
            SwitchListTile(
              title: const Text(
                'Hiệu ứng âm thanh',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: isSoundEffectsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isSoundEffectsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
