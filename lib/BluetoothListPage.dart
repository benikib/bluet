import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothListPage extends StatefulWidget {
  @override
  _BluetoothListPageState createState() => _BluetoothListPageState();
}

class _BluetoothListPageState extends State<BluetoothListPage> {
  List<BluetoothDevice> _devicesList = [];

  @override
  void initState() {
    super.initState();
    _getAllBluetoothDevices();
  }

  Future<void> _getAllBluetoothDevices() async {
    final FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
    try {
      _devicesList = await bluetooth.getBondedDevices();
      setState(() {});
    } catch (exception) {
      print('erreur de connexion: $exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth List'),
      ),
      body: ListView.builder(
        itemCount: _devicesList.length,
        itemBuilder: (context, index) {
          final device = _devicesList[index];
          return ListTile(
            title: Text(device.name ?? 'appareil inconu'),
            subtitle: Text(device.address),
            trailing: IconButton(
              icon: const Icon(Icons.connect_without_contact),
              onPressed: () {

              },
            ),
          );
        },
      ),
    );
  }
}