import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:katar_fix/Home.dart';
import 'package:katar_fix/akun.dart';
import 'package:katar_fix/anggota.dart';
import 'package:katar_fix/sejarah.dart';

class MainNavigation extends StatefulWidget {
  final VoidCallback signOut;
  MainNavigation(this.signOut);
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final String url = 'http://192.168.100.7/api_karangtaruna/api/login';
  List data;
  int _currentIndex;
  var page;

  bool isLogin;
  Future<String> getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      //RESPONSE YANG DIDAPATKAN DARI API TERSEBUT DI DECODE
      var content = json.decode(res.body);
      //KEMUDIAN DATANYA DISIMPAN KE DALAM VARIABLE data,
      //DIMANA SECARA SPESIFIK YANG INGIN KITA AMBIL ADALAH ISI DARI KEY hasil
      data = content['hasil'];
    });
    return 'success!';
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  void initState() {
    _currentIndex = 0;
    page = Home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLogin);
    return Scaffold(
      body: page,
      bottomNavigationBar: bmnav.BottomNav(
        color: Colors.white,
        labelStyle: bmnav.LabelStyle(
            visible: true,
            showOnSelect: false,
            onSelectTextStyle: TextStyle(
              color: Colors.grey,
              height: 1.8,
            ),
            textStyle: TextStyle(
              color: Colors.grey,
              height: 1.8,
            )),
        iconStyle: bmnav.IconStyle(
            color: Colors.grey[400], onSelectSize: 22.0, size: 22.0),
        elevation: 6.0,
        onTap: (i) {
          _currentIndex = i;
          _currentPage(i);
        },
        index: _currentIndex,
        items: [
          bmnav.BottomNavItem(Icons.home, label: 'Home'),
          bmnav.BottomNavItem(Icons.assessment, label: 'Anggota'),
          bmnav.BottomNavItem(Icons.person, label: 'Akun'),
        ],
      ),
    );
  }

  void _currentPage(int i) {
    if (i == 0) {
      setState(() {
        page = Home();
      });
    } else if (i == 1) {
      setState(() {
        page = Anggota();
      });
    } else {
      setState(() {
        page = Akun(signOut);
      });
    }
  }
}
