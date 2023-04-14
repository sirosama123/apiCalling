import 'package:apicalling/screens/landingPage.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Navbar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home_filled,
      "Home",
      Color(0xff36454f),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Color(0xff36454f)
      ),
      circleStrokeColor: Colors.white
    ),
    TabItem(
      
      CupertinoIcons.heart_solid,
      "Favourities",
      Color(0xff36454f),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Color(0xff36454f)
      ),
      circleStrokeColor: Colors.white
    ),
    TabItem(
      Icons.shopping_bag,
      "Cart",
      Color(0xff36454f),
       labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Color(0xff36454f)
      ),
      circleStrokeColor: Colors.white
    ),
    TabItem(
      Icons.person,
      "Profile",
      Color(0xff36454f),
       labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Color(0xff36454f)
      ),
      circleStrokeColor: Colors.white
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor;
    Widget slogan;
    switch (selectedPos) {
      case 0:
        slogan = LandingPage();
        selectedColor=Colors.white;
        break;
      case 1:
        slogan = Container();
        selectedColor=Colors.white;
        break;
      case 2:
        slogan = Container( 
          child: Text("this is page 3"),
        );
        selectedColor=Colors.white;
        break;
      case 3:
        slogan = Container( 
          child: Text("this is page 4"),
        );
        selectedColor=Colors.white;
        break;
      default:
        slogan = Container( 
          child: Text("this is page 5"),
        );
        selectedColor=Colors.white;
        break;
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: selectedColor,
      child: Center(
       child: slogan, 
      ),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      iconsSize: 23,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      // barBackgroundColor: Color.fromARGB(255, 208, 208, 208),
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Color(0xffD3D3D3),
      //     Color(0xffBDBDBD),
      //   ],
      // ),
     barBackgroundColor: Colors.white,
      // backgroundBoxShadow: <BoxShadow>[
      //   BoxShadow(
      //     offset: Offset(1, 1),
      //     color: Colors.black45, blurRadius: 5.0),
      // ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}