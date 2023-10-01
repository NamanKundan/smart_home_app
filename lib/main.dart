import 'package:flutter/material.dart';

void main() {
  runApp(HomeAutomationApp());
}

class HomeAutomationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Automation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Automation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DeviceCard(deviceName: 'Living Room Light', icon: Icons.lightbulb),
            SizedBox(height: 16.0),
            DeviceCard(deviceName: 'Bedroom Fan', icon: Icons.ac_unit),
            SizedBox(height: 16.0),
            DeviceCard(deviceName: 'Kitchen Light', icon: Icons.lightbulb),
            SizedBox(height: 16.0),
            DeviceCard(deviceName: 'Bathroom Light', icon: Icons.lightbulb),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final IconData icon;

  DeviceCard({required this.deviceName, required this.icon});

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isDeviceOn = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(widget.icon),
        title: Text(widget.deviceName),
        trailing: Switch(
          value: isDeviceOn,
          onChanged: (newValue) {
            setState(() {
              isDeviceOn = newValue;
              // Add code to control the device here (e.g., send commands to a smart home system).
            });
          },
        ),
      ),
    );
  }
}
