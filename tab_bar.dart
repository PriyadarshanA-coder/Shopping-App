import 'package:demo/men.dart';
import 'package:flutter/material.dart';
import 'women.dart';
import 'all.dart';

class TabBars extends StatefulWidget {
  const TabBars({super.key});


  @override
  State<TabBars> createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: DefaultTabController(
        length: 3,
        child: Container(
          color: Color(0xFFFDF6EC),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(12),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Color(0xFF7B5E57)),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  labelColor: Color(0xFF7B5E57),
                  unselectedLabelColor: Color(0xFFCBBFAD),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Men"),
                    Tab(text: "Women"),
                  ],
                ),
              ),
              Expanded(child: TabBarView(children: [All(), Men(), Women()])),
            ],
          ),
        ),
      ),
    );
  }
}
