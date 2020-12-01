import 'package:flutter/material.dart';
import 'package:katar_fix/sejarah.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Karang Taruna'),
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[Employee()],
      )),
      //ADAPUN UNTUK LOOPING DATA PEGAWAI, KITA GUNAKAN LISTVIEW BUILDER
      //KARENA WIDGET INI SUDAH DILENGKAPI DENGAN FITUR SCROLLING
      // body: RefreshIndicator(
      //   //ADAPUN FUNGSI YANG DIJALANKAN ADALAH getHome() DARI Home_PROVIDER
      //   onRefresh: () =>
      //       Provider.of<HomeProvider>(context, listen: false).getHome(),
      //   color: Colors.red,
      //   child: Container(
      //     margin: EdgeInsets.all(10),
      //     //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
      //     child: FutureBuilder(
      //       //DENGAN MENJALANKAN FUNGSI YANG SAMA
      //       future: Provider.of<HomeProvider>(context, listen: false)
      //           .getHome(),
      //       builder: (context, snapshot) {
      //         //JIKA PROSES REQUEST MASIH BERLANGSUNG
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           //MAKA KITA TAMPILKAN INDIKATOR LOADING
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //         //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
      //         //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
      //         //MAKA KITA GUNAKAN CONSUMER
      //         return Consumer<HomeProvider>(
      //           builder: (context, data, _) {
      //             //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
      //             return ListView.builder(
      //               //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataHome
      //               itemCount: data.dataHome.length,
      //               itemBuilder: (context, i) {
      //                 return Card(
      //                     elevation: 8,
      //                     child: Container(
      //                       padding: EdgeInsets.all(10.0),
      //                       child: Column(
      //                         children: <Widget>[
      //                           Container(
      //                             padding: EdgeInsets.all(20.0),
      //                             child: ClipRRect(
      //                               borderRadius: BorderRadius.circular(30.0),
      //                               child: Image(
      //                                 image: AssetImage(
      //                                     'lib/assets/logo_katar.PNG'),
      //                                 fit: BoxFit.cover,
      //                               ),
      //                             ),
      //                           ),
      //                           ListTile(
      //                             title: Text(
      //                               //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAHome
      //                               //SESUAI INDEX YANG SEDANG DILOOPING
      //                               data.dataHome[i].sejarah,
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     )
      //                     // child: ListTile(
      //                     //   title: Text(
      //                     //     //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAHome
      //                     //     //SESUAI INDEX YANG SEDANG DILOOPING
      //                     //     data.dataHome[i].sejarah,
      //                     //     style: TextStyle(
      //                     //         fontSize: 18, fontWeight: FontWeight.bold),
      //                     //   ),
      //                     //   subtitle:
      //                     //       Text("\Kode : ${data.dataHome[i].sejarah}"),
      //                     //   leading: Image.network(
      //                     //     'http://192.168.100.7/sisfo_taruna/uploads/' +
      //                     //         '${data.dataHome[i]}',
      //                     //     fit: BoxFit.cover,
      //                     //     height: 60.0,
      //                     //     width: 60.0,
      //                     //   ),
      //                     // ),
      //                     );
      //               },
      //             );
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

// class Home extends StatelessWidget {
//   //DUMMY DATA YANG AKAN DITAMPILKAN SEBELUM MELAKUKAN HIT KE API
//   //ADAPUN FORMAT DATANYA MENGIKUTI STRUKTU YANG SUDAH DITETAPKAN PADA HomeMODEL
//   // final data = [
//   //   HomeModel(
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Aplikasi Karang Taruna'),
//       ),
//       //ADAPUN UNTUK LOOPING DATA PEGAWAI, KITA GUNAKAN LISTVIEW BUILDER
//       //KARENA WIDGET INI SUDAH DILENGKAPI DENGAN FITUR SCROLLING
//       body: RefreshIndicator(
//         //ADAPUN FUNGSI YANG DIJALANKAN ADALAH getHome() DARI Home_PROVIDER
//         onRefresh: () =>
//             Provider.of<HomeProvider>(context, listen: false).getHome(),
//         color: Colors.red,
//         child: Container(
//           margin: EdgeInsets.all(10),
//           //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
//           child: FutureBuilder(
//             //DENGAN MENJALANKAN FUNGSI YANG SAMA
//             future: Provider.of<HomeProvider>(context, listen: false)
//                 .getHome(),
//             builder: (context, snapshot) {
//               //JIKA PROSES REQUEST MASIH BERLANGSUNG
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 //MAKA KITA TAMPILKAN INDIKATOR LOADING
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
//               //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
//               //MAKA KITA GUNAKAN CONSUMER
//               return Consumer<HomeProvider>(
//                 builder: (context, data, _) {
//                   //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
//                   return ListView.builder(
//                     //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataHome
//                     itemCount: data.dataHome.length,
//                     itemBuilder: (context, i) {
//                       return Card(
//                           elevation: 8,
//                           child: Container(
//                             padding: EdgeInsets.all(10.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   padding: EdgeInsets.all(20.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     child: Image(
//                                       image: AssetImage(
//                                           'lib/assets/logo_katar.PNG'),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 ListTile(
//                                   title: Text(
//                                     //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAHome
//                                     //SESUAI INDEX YANG SEDANG DILOOPING
//                                     data.dataHome[i].sejarah,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                           // child: ListTile(
//                           //   title: Text(
//                           //     //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAHome
//                           //     //SESUAI INDEX YANG SEDANG DILOOPING
//                           //     data.dataHome[i].sejarah,
//                           //     style: TextStyle(
//                           //         fontSize: 18, fontWeight: FontWeight.bold),
//                           //   ),
//                           //   subtitle:
//                           //       Text("\Kode : ${data.dataHome[i].sejarah}"),
//                           //   leading: Image.network(
//                           //     'http://192.168.100.7/sisfo_taruna/uploads/' +
//                           //         '${data.dataHome[i]}',
//                           //     fit: BoxFit.cover,
//                           //     height: 60.0,
//                           //     width: 60.0,
//                           //   ),
//                           // ),
//                           );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
