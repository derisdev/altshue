import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class DescriptionNews extends StatelessWidget {
  const DescriptionNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Jakarta, CNN Indonesia -- Sejumlah operator seluler meluncurkan teknologi jaringan 5G di beberapa kota di Indonesia. Meskipun wilayah cakupannya belum luas, hal ini menjadi sebuah langkah besar untuk dunia telekomunikasi di Indonesia. Perusahaan plat merah Telkomsel menjadi yang pertama menyajikan layanan 5G di Indonesia, dan mulai memberikan layanan 5G bagi pelanggannya sejak 27 Mei 2021. Tak lama setelah peluncuran 5G dari Telkomsel, Indosat Ooredoo mulai menyajikan layanannya di bulan berikutnya. Terhitung sejak 7 Juni 2021, Indosat Ooredoo resmi memberikan layanan 5G bagi pelanggannya.',
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: Palette.mineShaft,
          height: 2,
          fontSize: 13,
          fontFamily: AppFontStyle.robotoReg),
    );
  }
}
