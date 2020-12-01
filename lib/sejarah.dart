import 'package:flutter/material.dart';
import 'package:katar_fix/provider/sejarah_provider.dart';
import 'package:provider/provider.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
      color: Colors.red,
      child: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder(
          future: Provider.of<EmployeeProvider>(context, listen: false)
              .getEmployee(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<EmployeeProvider>(
              builder: (context, data, _) {
                return ListView.builder(
                  itemCount: data.dataEmployee.length,
                  itemBuilder: (context, i) {
                    return Card(
                        elevation: 8,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image(
                                    image: AssetImage('assets/logo_katar.PNG'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  data.dataEmployee[i].sejarah,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                        // child: ListTile(
                        //   title: Text(
                        //     //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAEMPLOYEE
                        //     //SESUAI INDEX YANG SEDANG DILOOPING
                        //     data.dataEmployee[i].sejarah,
                        //     style: TextStyle(
                        //         fontSize: 18, fontWeight: FontWeight.bold),
                        //   ),
                        //   subtitle:
                        //       Text("\Kode : ${data.dataEmployee[i].sejarah}"),
                        //   leading: Image.network(
                        //     'http://192.168.100.7/sisfo_taruna/uploads/' +
                        //         '${data.dataEmployee[i]}',
                        //     fit: BoxFit.cover,
                        //     height: 60.0,
                        //     width: 60.0,
                        //   ),
                        // ),
                        );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:katar_fix/provider/sejarah_provider.dart';
// import 'package:provider/provider.dart';

// class Employee extends StatelessWidget {
//   //DUMMY DATA YANG AKAN DITAMPILKAN SEBELUM MELAKUKAN HIT KE API
//   //ADAPUN FORMAT DATANYA MENGIKUTI STRUKTU YANG SUDAH DITETAPKAN PADA EMPLOYEEMODEL
//   // final data = [
//   //   EmployeeModel(
//   //     id: "1",
//   //     sejarah: "ji",
//   //     // "Pertama kali Karang Taruna lahir yaitu pada tanggal 26 September 1960 di Kampung Melayu, Jakarta. Kelahiran gerakan ini merupakan perwujudan semangat kepedulian generasi muda untuk turut mencegah dan menanggulangi masalah kesejahteraan sosial masyarakat, terutama yang dihadapi anak dan remaja di lingkungannya. Sejarah perkembangan Karang Taruna di Indonesia mencakup beberapa era, dan setiap era mempunyai cerita sendiri yang menjadi sejarah bagi Karang Taruna. Berikut ini adalah sejarah Karang Taruna di Indonesia   Karang taruna Di Tahun 1960 - 1069 Tahun 1960–1969 adalah saat awal dimana Bangsa Indonesia mulai melaksanakan pembangunan disegala bidang. Instansi-Instansi Sosial di DKI Jakarta (Jawatan Pekerjaan Sosial/Departemen Sosial) berupaya menumbuhkan Karang Taruna–Karang Taruna baru di kelurahan melalui kegiatan penyuluhan sosial. Pertumbuhan Karang Taruna saat itu terbilang sangat lambat, tahun 1969 baru terbentuk 12 Karang Taruna, hal ini disebabkan peristiwa G 30 S/PKI sehingga",
//   //     visi:
//   //         "Mempererat tali persaudaraan antar pemuda untuk meningkatkan partisipasi pemuda dalam kegiatan-kegiatan yang bermanfaat di masyarakat guna meningkatkan peran organisasi kepemudaan. Mewujudkan generasi muda yang berilmu pengetahuan, kreatif, Mandiri,",
//   //     misi:
//   //         "Membangun dan meningkatkan Ekonomi Produktif. Kepedulian terhadap lingkungan sosial masyarakat. Menggalang kemitraan dengan berbagai pihak yang berkompeten dalam masalah Pemuda dan sosial kemasyarakatan. Terwujudnya kesejahteraan sosial yang semakin meningkat bagi warga Kelurahan Margajaya pada umumnya dan khususnya generasi muda yang memungkinkan pelaksanaan fungsi sosialnya sebagai manusia pembangunan yang mampu mengatasi masalah sosial di lingkungannya.",
//   //   ),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       //ADAPUN FUNGSI YANG DIJALANKAN ADALAH getEmployee() DARI EMPLOYEE_PROVIDER
//       onRefresh: () =>
//           Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
//       color: Colors.red,
//       child: Container(
//         margin: EdgeInsets.all(10),
//         //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
//         child: FutureBuilder(
//           //DENGAN MENJALANKAN FUNGSI YANG SAMA
//           future: Provider.of<EmployeeProvider>(context, listen: false)
//               .getEmployee(),
//           builder: (context, snapshot) {
//             //JIKA PROSES REQUEST MASIH BERLANGSUNG
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               //MAKA KITA TAMPILKAN INDIKATOR LOADING
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
//             //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
//             //MAKA KITA GUNAKAN CONSUMER
//             return Consumer<EmployeeProvider>(
//               builder: (context, data, _) {
//                 //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
//                 return ListView.builder(
//                   //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataEmployee
//                   itemCount: data.dataEmployee.length,
//                   itemBuilder: (context, i) {
//                     return Card(
//                         elevation: 8,
//                         child: Container(
//                           padding: EdgeInsets.all(10.0),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(30.0),
//                                   child: Image(
//                                     image:
//                                         AssetImage('lib/assets/logo_katar.PNG'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               ListTile(
//                                 title: Text(
//                                   //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAEMPLOYEE
//                                   //SESUAI INDEX YANG SEDANG DILOOPING
//                                   data.dataEmployee[i].sejarah,
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                         // child: ListTile(
//                         //   title: Text(
//                         //     //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAEMPLOYEE
//                         //     //SESUAI INDEX YANG SEDANG DILOOPING
//                         //     data.dataEmployee[i].sejarah,
//                         //     style: TextStyle(
//                         //         fontSize: 18, fontWeight: FontWeight.bold),
//                         //   ),
//                         //   subtitle:
//                         //       Text("\Kode : ${data.dataEmployee[i].sejarah}"),
//                         //   leading: Image.network(
//                         //     'http://192.168.100.7/sisfo_taruna/uploads/' +
//                         //         '${data.dataEmployee[i]}',
//                         //     fit: BoxFit.cover,
//                         //     height: 60.0,
//                         //     width: 60.0,
//                         //   ),
//                         // ),
//                         );
//                   },
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
