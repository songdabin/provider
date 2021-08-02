import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:vacation_project/provider/bottom_navigation_provider.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  //BottomNavigationProvider _bottomNavigationProvider;
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List<List<String>> tableData = [
    ["교시", "월", "화", "수", "목", "금"],
    ["1", " ", " ", " ", " ", "실전\n프로젝트"],
    ["2", " ", "실전\n프로젝트", " ", " ", "실전\n프로젝트"],
    ["3", "컴퓨터 구조", "웹 서비스\n개발", " ", "컴퓨터 구조", "이산수학"],
    ["4", " ", " ", " ", " ", " "],
    ["5", " ", "이산수학", "채플", " ", "이산수학"],
    ["6", "환경과 인간", " ", "팀모임", "환경과 인간", " "],
  ];

  final List<String> noColor = ["교시", "월", "화", "수", "목", "금", "1", "2", "3", "4", "5", "6"];

  //BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text1(),
            Container(height: 10.0),
            Container(
              width: 500.0,
              height: 500.0,
              child: Column(
                children: this
                  .tableData
                  .map<Widget>((List<String> l) => Expanded(
                      child: Row(
                        children: l
                          .map<Widget>((String i) => Expanded(
                            child: (i == " " || i == "1" || i == "2" || i == "3" || i == "4" || i == "5" || i == "6" || i == "교시" || i == "월" || i == "화" || i == "수" || i == "목" || i == "금") ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:Colors.black)
                              ),
                              alignment: Alignment.center,
                              child: Text(i.toString(),
                                style: TextStyle(
                                  color:Colors.black,
                                )
                              )
                            ) : 
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff5b8dc9),
                                border: Border.all(
                                  color:Colors.black)
                              ),
                              alignment: Alignment.center,
                              child: Text(i.toString(),
                                style: TextStyle(
                                  color:Colors.black)
                              )
                            ),
                          )
                        )
                      .toList()),
                    )
                  )
                .toList()
              )
            ),
          ],
        )
      );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "시간표"),
        BottomNavigationBarItem(icon: Icon(Icons.umbrella), label: "분실물"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
      ],
      //currentIndex: _bottomNavigationProvider.currentPage,
      selectedItemColor: Color(0xFF3A70AF),
      //onTap: (index) {
        //_bottomNavigationProvider.updateCurrentPage(index);
      //},
    );
  }

  @override
  Widget build(BuildContext context) {
    //_bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("홈"),
        centerTitle: true,
        backgroundColor: Color(0xFF3A70AF),
      ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  Widget _text1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 20.0),
        Text(
          '시간표',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}