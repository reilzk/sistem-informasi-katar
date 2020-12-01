import 'package:flutter/material.dart';
import 'package:katar_fix/model/anggota_m.dart';
import 'package:katar_fix/provider/anggota_provider.dart';
import 'package:provider/provider.dart';
import 'provider/anggota_provider.dart';

class Employee extends StatelessWidget {
  //DUMMY DATA YANG AKAN DITAMPILKAN SEBELUM MELAKUKAN HIT KE API
  //ADAPUN FORMAT DATANYA MENGIKUTI STRUKTU YANG SUDAH DITETAPKAN PADA EMPLOYEEMODEL
  final data = [
    EmployeeModel(
      id: "1",
      jabatan: "Ketua",
      nama_lengkap: "Kardi Adit",
      alamat: "jl.sumur binong 7",
      email: "adhitgrunch99@gmail.com",
      telepon: "081514717595",
      photo: "",
    ),
    EmployeeModel(
      id: "2",
      jabatan: "Wakil Ketua",
      nama_lengkap: "Andri",
      alamat: "jl.sumur binong 7",
      email: "khatel321@gmail.com",
      telepon: "081283894150",
      photo: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Karang Taruna Anggota CRUD'),
      ),
      //ADAPUN UNTUK LOOPING DATA PEGAWAI, KITA GUNAKAN LISTVIEW BUILDER
      //KARENA WIDGET INI SUDAH DILENGKAPI DENGAN FITUR SCROLLING
      body: RefreshIndicator(
        //ADAPUN FUNGSI YANG DIJALANKAN ADALAH getEmployee() DARI EMPLOYEE_PROVIDER
        onRefresh: () =>
            Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
          child: FutureBuilder(
            //DENGAN MENJALANKAN FUNGSI YANG SAMA
            future: Provider.of<EmployeeProvider>(context, listen: false)
                .getEmployee(),
            builder: (context, snapshot) {
              //JIKA PROSES REQUEST MASIH BERLANGSUNG
              if (snapshot.connectionState == ConnectionState.waiting) {
                //MAKA KITA TAMPILKAN INDIKATOR LOADING
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
              //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
              //MAKA KITA GUNAKAN CONSUMER
              return Consumer<EmployeeProvider>(
                builder: (context, data, _) {
                  //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
                  return ListView.builder(
                    //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataEmployee
                    itemCount: data.dataEmployee.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(
                            //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAEMPLOYEE
                            //SESUAI INDEX YANG SEDANG DILOOPING
                            data.dataEmployee[i].nama_lengkap,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "\jabatan : ${data.dataEmployee[i].jabatan}"
                              "\alamat   : ${data.dataEmployee[i].alamat}"
                              "\email    : ${data.dataEmployee[i].email}"
                              "\telepon  : ${data.dataEmployee[i].telepon}"),
                          leading: Image.network(
                            'http://192.168.100.7/sisfo_taruna/uploads/' +
                                '${data.dataEmployee[i].photo}',
                            fit: BoxFit.cover,
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
