package Dart;

class Jubah {
  String nama;
  int kekuatan;
  int kesehatan;

  Jubah(this.nama, this.kekuatan, this.kesehatan);

  String getNama() => nama;

  int getTambahKesehatan() => kesehatan * 10;

  int getNilaiKekuatan() => kekuatan * 2;
}
