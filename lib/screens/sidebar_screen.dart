import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import '../components/sidebar_row.dart';
import '../model/sidebar.dart';

class SideBarScreen extends StatefulWidget {
  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _name;
  Future<String> _getname() async {
    final SharedPreferences prefs = await _prefs;
    final String name = (prefs.getString('name') ?? '');

    return name;
  }

  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('id');
    await prefs.remove('email').then((value) => Navigator.pop(context));

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _name = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: kSidebarBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(34.0),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  /*
                  const CircleAvatar(
                    backgroundImage: AssetImage('asset/images/profile.jpg'),
                    radius: 21.0,
                  ),
                  */
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                        future: _name,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            case ConnectionState.active:
                            case ConnectionState.done:
                              return Text(
                                'Welcome Back ${snapshot.data}',
                                style: kHeadlineLabelStyle,
                              );
                          }
                        },
                      ),
                      const SizedBox(height: 4),
                      /*
                      Text(
                        "random random",
                        style: kSearchPlaceholderStyle,
                      )
                      */
                    ],
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              SideBarRow(
                item: sidebarItem[0],
              ),
              const SizedBox(height: 32.0),
              SideBarRow(
                item: sidebarItem[1],
              ),
              const SizedBox(height: 32.0),
              SideBarRow(
                item: sidebarItem[2],
              ),
              const SizedBox(height: 32.0),
              const Spacer(),
              GestureDetector(
                onTap: logout,
                child: Row(
                  children: [
                    Image.asset("asset/icons/icon-logout.png", width: 17.0),
                    const SizedBox(width: 12.0),
                    Text(
                      "Logout",
                      style: kSecondaryCalloutLabelStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
