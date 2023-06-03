import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freestyles/core/AppRouting.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double aspectRatio = size.aspectRatio;
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 10,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            _drawerKey..currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.teal,
                border: Border(bottom: BorderSide.none),
              ),
              accountName: Text(
                "christ dev",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: aspectRatio * 50,
                ),
              ),
              currentAccountPicture: Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
              ),
              accountEmail: Text(
                "christdev19@gmail.com",
                style: TextStyle(
                  fontSize: aspectRatio * 35,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    _buildItemDrawer(
                      icon: CupertinoIcons.square_grid_2x2,
                      label: "Connexion",
                      onTap: () => Navigator.pushNamed(context, AppRouting.login),
                    ),
                    _buildItemDrawer(
                      icon: CupertinoIcons.square_grid_2x2,
                      label: "Création de compte",
                      onTap: () => Navigator.pushNamed(context, AppRouting.register),
                    ),
                    _buildItemDrawer(
                      icon: CupertinoIcons.square_grid_2x2,
                      label: "Accueil",
                      onTap: () => Navigator.pushNamed(context, AppRouting.home),
                    ),
                    _buildItemDrawer(
                      icon: CupertinoIcons.square_grid_2x2,
                      label: "Corporate Wellness",
                      onTap: () => Navigator.pushNamed(context, AppRouting.corporateWellness),
                    ),
                    _buildItemDrawer(
                      icon: CupertinoIcons.square_grid_2x2,
                      label: "Dragable Custom",
                      onTap: () => Navigator.pushNamed(context, AppRouting.dragableCustom),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDrawer(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 21,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
            ),
            Flexible(
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
