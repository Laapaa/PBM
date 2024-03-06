class Senjata {
  final String nama;
  final int kekuatan;

  Senjata({required this.nama, required this.kekuatan});

  String getNama() => nama;

  int getKekuatanSerang() => kekuatan * 2;
}
