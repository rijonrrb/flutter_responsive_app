import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class NavbarSm extends StatelessWidget {
  const NavbarSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the drawer
            },
          ),
          NavLogo(),
        ],
      ),
    );
  }
}

class NavbarLg extends StatelessWidget {
  const NavbarLg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavMenu('Episodes'),
              SizedBox(
                width: 60,
              ),
              NavMenu('About'),
            ],
          )
        ],
      ),
    );
  }
}

class NavLogo extends StatelessWidget {
  const NavLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 150,
      child: Image.asset('assets/logo.png'),
    );
  }
}

class NavMenu extends StatelessWidget {
  final String title;
  const NavMenu(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => NavbarSm(),
      tablet: (BuildContext context) => NavbarLg(),
    );
  }
}