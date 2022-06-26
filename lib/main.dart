import 'package:flutter/material.dart';

import 'custom_painting_exer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomPaintViewScreen(),
    );
  }
}

class BMNavigationView extends StatefulWidget {
  const BMNavigationView({Key? key}) : super(key: key);

  @override
  _BMNavigationViewState createState() => _BMNavigationViewState();
}

class _BMNavigationViewState extends State<BMNavigationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
      bottomNavigationBar: BottomNavigation(
        items: [
          CustomNavigationItem(
            index: 0,
            label: 'Explorer',
          ),
          CustomNavigationItem(
            index: 1,
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          CustomNavigationItem(
            index: 2,
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
          CustomNavigationItem(
            index: 3,
            icon: Icon(
              Icons.perm_identity_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CustomNavigationItem> items;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue[900],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          widget.items.length,
          (index) => Padding(
            padding: index == widget.items.length - 1
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = widget.items[index].index;
                });
              },
              child: NavigationIcon(
                item: widget.items[index],
                selected: selectedIndex == widget.items[index].index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({
    Key? key,
    required this.item,
    required this.selected,
  }) : super(key: key);
  final CustomNavigationItem item;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return item.isIcon
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon!,
              Visibility(
                visible: selected,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Visibility(
                visible: selected,
                child: Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                item.label!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          );
  }
}

class CustomNavigationItem {
  final int index;
  final String? label;
  final Widget? icon;

  CustomNavigationItem({
    required this.index,
    this.label,
    this.icon,
  }) : assert(label == null || icon == null);

  bool get isLabel => icon == null;
  bool get isIcon => label == null;

  Widget method1() {
    return SizedBox();
  }

  Widget method2() {
    return SizedBox();
  }

  Widget method3() {
    return SizedBox();
  }
}
