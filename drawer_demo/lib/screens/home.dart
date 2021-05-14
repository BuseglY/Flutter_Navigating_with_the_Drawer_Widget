import 'package:drawer_demo/screens/customer_screen.dart';
import 'package:drawer_demo/screens/product_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer demo"),
      ),
      body: Container(
        child: Center(
          child: Text("AnaSayfa"),
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Drawer createMenuItems(BuildContext context) {
    createNavigationItem(var icon, String page, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(page),
        onTap: () {
          setState(() {
            Navigator.of(context).pop(); //drawer ı kapatır.
            Navigator.of(context)
                .pushNamed(routeName); //Yeni sayfaya gidebilmek için.
          });
        },
      );
    }

    var navigationList = [
      createNavigationItem(
          Icons.account_box, "Customers", CustomerScreen.routeName),
      createNavigationItem(Icons.shop, "Products", ProductScreen.routeName),
      createNavigationItem(Icons.home, "Home", "/")
    ];

    ListView menuItems = new ListView(
      children: navigationList,
    );

    return Drawer(child: menuItems,);
  }

  buildDrawer(BuildContext context) {
    return new Drawer(
      child: createMenuItems(context),
    );
  }
}
