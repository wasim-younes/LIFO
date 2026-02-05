import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  int _reminderMinutes = 30;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
      _soundEnabled = prefs.getBool('sound_enabled') ?? true;
      _vibrationEnabled = prefs.getBool('vibration_enabled') ?? true;
      _reminderMinutes = prefs.getInt('reminder_minutes') ?? 30;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', _notificationsEnabled);
    await prefs.setBool('sound_enabled', _soundEnabled);
    await prefs.setBool('vibration_enabled', _vibrationEnabled);
    await prefs.setInt('reminder_minutes', _reminderMinutes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive reminders for your events'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
              _saveSettings();
            },
          ),
          SwitchListTile(
            title: const Text('Sound'),
            subtitle: const Text('Play sound with notifications'),
            value: _soundEnabled,
            onChanged: _notificationsEnabled
                ? (value) {
                    setState(() {
                      _soundEnabled = value;
                    });
                    _saveSettings();
                  }
                : null,
          ),
          SwitchListTile(
            title: const Text('Vibration'),
            subtitle: const Text('Vibrate with notifications'),
            value: _vibrationEnabled,
            onChanged: _notificationsEnabled
                ? (value) {
                    setState(() {
                      _vibrationEnabled = value;
                    });
                    _saveSettings();
                  }
                : null,
          ),
          ListTile(
            title: const Text('Default Reminder Time'),
            subtitle: Text('$_reminderMinutes minutes before event'),
          ),
          Slider(
            value: _reminderMinutes.toDouble(),
            min: 5,
            max: 60,
            divisions: 11,
            label: '$_reminderMinutes minutes',
            onChanged: _notificationsEnabled
                ? (value) {
                    setState(() {
                      _reminderMinutes = value.round();
                    });
                    _saveSettings();
                  }
                : null,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'You will receive notifications:\n'
              '• 30 minutes before event\n'
              '• 10 minutes before event\n'
              '• At event start time\n'
              '• 15 minutes before event end (for long events)',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
