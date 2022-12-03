import 'package:fitness_mobile/components/Header.dart';
import 'package:fitness_mobile/components/tab_view_base.dart';
import 'package:flutter/material.dart';

class Diet extends StatelessWidget {

  const Diet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Header(
                'Diet',
                rightSide: Container(
                  height: 35.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(100, 140, 255, 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                tabs: const <Widget>[
                  SizedBox(
                    height: 30.0,
                    child: Tab(
                      text: 'Breakfast',
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: Tab(
                      text: 'Lunch',
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: Tab(
                      text: 'Dinner',
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: Tab(
                      text: 'Snacks',
                    ),
                  ),
                ],
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: const Color.fromRGBO(215, 225, 255, 1.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabViewBase(
                  tabName: 'Breakfast',
                ),
                TabViewBase(
                  tabName: 'Lunch',
                ),
                TabViewBase(
                  tabName: 'Dinner',
                ),
                TabViewBase(
                  tabName: 'Snacks',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
