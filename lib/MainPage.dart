import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_1915016084_yudiaulia/HalamanForm.dart';
import 'package:postest7_1915016084_yudiaulia/LandingPage.dart';
import 'package:postest7_1915016084_yudiaulia/detail_page.dart';
import 'package:postest7_1915016084_yudiaulia/Controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> _myItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: "Notification"),
  ];

  final List<Widget> _myViews = [HomePage(), HalamanForm(), notification()];
  final Controller colorAppbar = Get.put(Controller());

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 212, 210, 210),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.orange,
                    Colors.red,
                  ],
                ),
              ),
              child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Smart Home",
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MainPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return LandingPage();
                }));
              },
            ),
            const ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Gadgets"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Smart Home"),
        flexibleSpace: Obx(() => Container(
              color:
                  colorAppbar.switchValue.value ? Colors.orange : Colors.green,
            )),
        actions: [
          Obx((() => Switch(
                value: colorAppbar.switchValue.value,
                onChanged: (newValue) {
                  colorAppbar.switchValue.value = newValue;
                },
              )))
        ],
      ),
      body: _myViews.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myItem,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final Controller colorBody = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: lebar,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: const Text(
                  "Welcome Home,",
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 48, left: 158),
                child: const Text(
                  "Jhon",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80, left: 20),
                child: const Text(
                  "Let's Manage Your Home",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return detailPage(
                          namaRuangan: "Living Room",
                        );
                      }));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 120,
                      width: lebar / 2.7,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/livingroom.png"),
                        ),
                      ),
                      child: const Text(
                        "Living Room",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return detailPage(namaRuangan: "Kitchen");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 120,
                      width: lebar / 2.7,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/kitchen.png",
                          ),
                        ),
                      ),
                      child: const Text(
                        "Kitchen",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return detailPage(namaRuangan: "BedRoom");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 120,
                      width: lebar / 2.7,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/bedroom.png"),
                        ),
                      ),
                      child: const Text(
                        "Bed Room",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return detailPage(namaRuangan: "BathRoom");
                      }));
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 120,
                      width: lebar / 2.7,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/bathroom.png"),
                        ),
                      ),
                      child: const Text(
                        "Bath Room",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 235, 235),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print(""),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/bedroom1.png',
                          height: 150, fit: BoxFit.fitWidth),
                    ),
                    const ListTile(
                      title: Text('Bed Room'),
                      subtitle: Text('0 Device'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print(""),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/kitchen1.png',
                          height: 150, fit: BoxFit.fitWidth),
                    ),
                    const ListTile(
                      title: Text('Kitchen'),
                      subtitle: Text('0 Device'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print(""),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/livingroom1.png',
                          height: 150, fit: BoxFit.fitWidth),
                    ),
                    const ListTile(
                      title: Text('Living Room'),
                      subtitle: Text('0 Device'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print(""),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset('assets/bathroom1.png',
                          height: 150, fit: BoxFit.fitWidth),
                    ),
                    const ListTile(
                      title: Text('Bath Room'),
                      subtitle: Text('0 Device'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
