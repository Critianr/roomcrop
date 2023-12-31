import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeiot/profile.dart';
import 'package:homeiot/class_builder.dart';
import 'package:homeiot/home.dart';
import 'package:homeiot/schedules.dart';
import 'package:homeiot/settings.dart';
import 'package:homeiot/stats.dart';
import 'package:kf_drawer/kf_drawer.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainWidget(title: "My Main Widget"),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  // KFDrawerController _drawerController;
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Inicio', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Perfil',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.account_box, color: Colors.white),
          page: Profile(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Notificaciónes',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.notifications_active, color: Colors.white),
          page: ClassBuilder.fromString('Notifications'),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Text(
        //     'Sensores',
        //     style: TextStyle(color: Colors.white, fontSize: 18),
        //   ),
        //   icon: Icon(Icons.trending_up, color: Colors.white),
        //   page: Stats(),
        // ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Sensores',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.av_timer, color: Colors.white),
          page: Schedules(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Configuración',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage('images/image.jpg'),
                        fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Cultivador 1', style: new TextStyle(fontSize: 17, color: Colors.white)),
                    new SizedBox(height: 2),
                    new Text('Cultivador', style: new TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(31, 58, 47, 1.0), Color.fromRGBO(31, 58, 47, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

