import 'package:altshue/app/constants/asset_path.dart';
import 'package:flutter/material.dart';

import 'contact_tile.dart';

class ContactDetail extends StatelessWidget {
  const ContactDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                    title: 'ask@altshue.com',
                  ),
                  TileContact(
                    icon: Icons.call,
                    title: '08123456789',
                  ),
                  TileContact(
                    icon: Icons.place,
                    title: 'Jl. Address Here',
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
