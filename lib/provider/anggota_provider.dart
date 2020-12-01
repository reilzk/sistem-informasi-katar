import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:katar_fix/model/anggota_m.dart';

class EmployeeProvider extends ChangeNotifier {
  //DEFINISIKAN PRIVATE VARIABLE DENGAN TYPE List dan VALUENYA MENGGUNAKAN FORMAT EMPLOYEEMODEL
  //DEFAULTNYA KITA BUAT KOSONG
  List<EmployeeModel> _data = [];
  //KARENA PRIVATE VARIABLE TIDAK BISA DIAKSES OLEH CLASS/FILE LAINNYA, MAKA DIPERLUKAN GETTER YANG BISA DIAKSES SECARA PUBLIC, ADAPUN VALUENYA DIAMBIL DARI _DATA
  List<EmployeeModel> get dataEmployee => _data;

  //BUAT FUNGSI UNTUK MELAKUKAN REQUEST DATA KE SERVER / API
  Future<List<EmployeeModel>> getEmployee() async {
    final url = 'http://192.168.100.7/sisfo_taruna/Api/get_anggota';
    final response = await http.get(url); //LAKUKAN REQUEST DATA

    //JIKA STATUSNYA BERHASIL ATAU = 200
    if (response.statusCode == 200) {
      //MAKA KITA FORMAT DATANYA MENJADI MAP DENGNA KEY STRING DAN VALUE DYNAMIC
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      //KEMUDIAN MAPPING DATANYA UNTUK KEMUDIAN DIUBAH FORMATNYA SESUAI DENGAN EMPLOYEEMODEL DAN DIPASSING KE DALAM VARIABLE _DATA
      _data = result
          .map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
