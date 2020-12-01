class EmployeeModel {
  String id;
  String sejarah;
  String visi;
  String misi;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  EmployeeModel({
    this.id,
    this.sejarah,
    this.visi,
    this.misi,
  });

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      id: json['id'],
      sejarah: json['sejarah'],
      visi: json['visi'],
      misi: json['misi']);
}
