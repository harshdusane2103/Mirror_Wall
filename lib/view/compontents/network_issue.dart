import 'package:flutter/material.dart';

class offLine_Code extends StatelessWidget {
  const offLine_Code({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/image/banner.gif'),
        ),
      ),
    );
  }
}