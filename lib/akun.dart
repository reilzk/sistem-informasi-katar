import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Akun extends StatefulWidget {
  final VoidCallback signOut;
  Akun(this.signOut);
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  final String url = 'http://192.168.100.7/sisfo_taruna/Api/login';
  List
      data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

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

//  String email = "", nama = "";
//  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
//      email = preferences.getString("email");
//      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    this.getData(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Halaman Dashboard"),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.lock_open),
              )
            ],
          ),
          body: Center(
            child: Text("Selamat Datang"),
          )),
    );
  }
}
