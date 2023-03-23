import 'package:artie/screens/userViews/childByUser.dart';
import 'package:artie/services/childAPI.dart';
import 'package:artie/services/userAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
 

  @override
  void initState() {
    super.initState();
    login();
  
  }

  void login() async{
     UserApiService.signInWithEmailAndPassword("farah.mannoubi@esprit.tn", "farahFarouha");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(title: Text(AppLocalizations.of(context)!.login),backgroundColor: Colors.amber[400],) ,     body: SingleChildScrollView(
        child: Column(
          children: [
     ElevatedButton(
  onPressed: (
    
  ) {
ChildApiService.getChildsByUser();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChildByUser(),
      ),
    );
  },
  child: Text('login'),
),

          ],
        ),
      ),
    );
  }
}