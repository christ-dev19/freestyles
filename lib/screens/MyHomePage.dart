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
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  List<dynamic> screens = [
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Dragable Custom",
      "route": AppRouting.draggableCustom,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Connexion",
      "route": AppRouting.login,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Création de compte",
      "route": AppRouting.register,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Accueil",
      "route": AppRouting.home,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Corporate Wellness",
      "route": AppRouting.corporateWellness,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Food Ordering App",
      "route": AppRouting.foodOrderingApp1,
    },
    {
      "icon": CupertinoIcons.square_grid_2x2,
      "label": "Event Mobile App",
      "route": AppRouting.eventMobileApp1,
    },
  ];

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
          icon: const Icon(
            Icons.list_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            _drawerKey.currentState!.openDrawer();
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
                    ...screens
                        .map(
                          (e) => _buildItemDrawer(
                            icon: e['icon'],
                            label: e['label'],
                            onTap: () =>
                                Navigator.pushNamed(context, e['route']),
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) newIndex--;
            screens.insert(newIndex, screens.removeAt(oldIndex));

            setState(() {});
          },
          children: screens
              .map(
                (e) => Padding(
                  key: ValueKey(e),
                  padding: const EdgeInsets.all(8.0),
                  child: _buildItemDrawer(
                    icon: e['icon'],
                    label: e['label'],
                    onTap: () => Navigator.pushNamed(context, e['route']),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildItemDrawer(
      {required IconData icon,
      required String label,
      required VoidCallback onTap,
      ValueKey? key}) {
    return InkWell(
      key: key,
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
