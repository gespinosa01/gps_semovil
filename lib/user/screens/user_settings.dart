import 'package:flutter/material.dart';
import 'package:gps_semovil/app/core/login.dart';
import 'package:gps_semovil/user/models/user_model.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
                print('IconButton presionado');
              },
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text('Nombre(s)'),
            subtitle: Text(widget.userModel.names!),
            leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.secondary),
          ),
          ListTile(
            title: const Text('Apellido Paterno'),
            subtitle: Text(widget.userModel.lastname!),
            leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.secondary),
          ),
          ListTile(
            title: const Text('Apellido Materno'),
            subtitle: Text(widget.userModel.lastname2!),
            leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            icon: const Icon(Icons.credit_card),
            label: const Text('Licencia digital'),
            onPressed: () {
              // Acción para Licencia digital
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              // Color de fondo
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              // Color del texto
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.payment),
            label: const Text('Formas de pago'),
            onPressed: () {
              // Acción para Formas de pago
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              // Color de fondo
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              // Color del texto
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Cerrar sesion'),
          ),
        ],
      ),
    );
  }
}
