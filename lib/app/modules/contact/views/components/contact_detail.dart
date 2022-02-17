import 'package:altshue/app/constants/asset_path.dart';
import 'package:flutter/material.dart';

import 'contact_tile.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({
    Key? key,
    required this.email,
    required this.phone,
    required this.adress,
  }) : super(key: key);

  final String email;
  final String phone;
  final String adress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetName.about, height: 86),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TileContact(
                    icon: Icons.email,
                    title: email,
                  ),
                  TileContact(
                    icon: Icons.call,
                    title: phone,
                  ),
                  TileContact(
                    icon: Icons.place,
                    title: adress,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
