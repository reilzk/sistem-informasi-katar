class EmployeeModel {
  String id;
  String jabatan;
  String nama_lengkap;
  String alamat;
  String email;
  String telepon;
  String ttl;
  String jenis_kelamin;
  String photo;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  EmployeeModel({
    this.id,
    this.jabatan,
    this.nama_lengkap,
    this.alamat,
    this.email,
    this.telepon,
    this.ttl,
    this.jenis_kelamin,
    this.photo,
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      id: json['id'],
      jabatan: json['jabatan'],
      nama_lengkap: json['nama_lengkap'],
      alamat: json['alamat'],
      email: json['email'],
      telepon: json['telepon'],
      ttl: json['ttl'],
      jenis_kelamin: json['jenis_kelamin'],
      photo: json['photo']);
}
