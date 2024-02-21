import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text('Home Page'),

      ),
      body: Center(),
    );
  }
}

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user@yeditepe.edu.tr'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/pots-vegetables-harvest_23-2147694057.jpg')),
              ),
          ),
          ListTile(
            leading: Icon(Icons.add_home_outlined),
            title: Text('Home'),
            trailing: Icon(Icons.arrow_back_ios_new),
            tileColor: Colors.greenAccent,
            onTap: () =>
                Navigator.pushNamed(context, "/HomeScreen"),
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Meal List'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () =>
                Navigator.pushNamed(context, "/MealList"),
          ),
          ListTile(
            leading: Icon(Icons.add_reaction_outlined),
            title: Text('Friends'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            leading: Icon(Icons.accessibility_new_outlined),
            title: Text('Daily Aim & Results'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.app_settings_alt),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }
}