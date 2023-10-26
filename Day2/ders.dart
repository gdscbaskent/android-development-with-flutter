class Ders {
  String dersKodu;
  int devamsizlik;

  Ders({required this.dersKodu, required this.devamsizlik});

  void devamsizlikEkle() {
    devamsizlik++;
  }

  void devamsizlikSil() {
    if (devamsizlik != 0) devamsizlik--; 
  }
}