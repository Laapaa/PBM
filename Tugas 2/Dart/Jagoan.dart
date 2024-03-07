package dart;

class Jagoan {
  String nama;
  int _kesehatanDasar;
  int _kekuatanDasar;
  int derajat;
  int _totalKerusakan;
  int _kenaikanKesehatan;
  int _kenaikanKekuatan;
  bool hidup;

  Jubah jubah;
  Senjata senjata;

  Jagoan(this.nama) {
    _kesehatanDasar = 100;
    _kekuatanDasar = 100;
    derajat = 1;
    _kenaikanKekuatan = 10;
    _kenaikanKesehatan = 10;
    hidup = true;
  }

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() => nama;

  int sehatMaksimal() => _kesehatanDasar + jubah.tambahKesehatan + derajat * _kenaikanKesehatan;

  int getKekuatanSerangJagoan() => _kekuatanDasar + senjata.kekuatanSerang + derajat * _kenaikanKekuatan;

  int getNilaiKesehatan() => sehatMaksimal() - _totalKerusakan;

  void naikDerajat() {
    derajat++;
  }

  bool getStatus() => hidup;

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();

    print('$nama menyerang $lawan.getNama() dengan kekuatan $kerusakan');

    lawan.bertahan(kerusakan);

    naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = jubah.nilaiKekuatan;
    int selisihKerusakan;

    print('$nama memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    _totalKerusakan += selisihKerusakan;

    if (getNilaiKesehatan() <= 0) {
      hidup = false;
      _totalKerusakan = sehatMaksimal();
    }

    info();
  }

  void info() {
    print('Jagoan\t\t\t: $nama');
    print('Derajat\t\t\t: $derajat');
    print('Kesehatan Dasar\t\t: $_kesehatanDasar');
    print('Kekuatan Dasar\t\t: $_kekuatanDasar');
    print('Kesehatan\t\t: $getNilaiKesehatan()/$sehatMaksimal()');
    print('Kekuatan Maksimal\t: $getKekuatanSerangJagoan()');
    print('Masih hidup?\t\t: $hidup\n');
  }

  void getNamaJubah() {
    print('Jubah\t\t\t: ${jubah.nama}');
  }

  void getNamaSenjata() {
    print('Senjata\t\t\t: ${senjata.nama}');
  }
}

class Jubah {
  String nama;
  int tambahKesehatan;
  int nilaiKekuatan;

  Jubah(this.nama, this.tambahKesehatan, this.nilaiKekuatan);
}

class Senjata {
  String nama;
  int kekuatanSerang;

  Senjata(this.nama, this.kekuatanSerang);
}
