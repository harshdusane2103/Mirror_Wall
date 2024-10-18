import 'package:flutter/material.dart';
import 'package:mirror_wall_ui/provider/urlProvider.dart';
import 'package:mirror_wall_ui/utils/golbal.dart';
import 'package:provider/provider.dart';

class Header_TextFormField extends StatelessWidget {
  const Header_TextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainProvider Providerfalse =
        Provider.of<MainProvider>(context, listen: false);
    return TextFormField(
      controller: txtsearch,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.link_sharp),
          suffixIcon: IconButton(
              onPressed: () {
                txtsearch.clear();
              },
              icon: Icon(Icons.cancel_outlined)),
          hintText: 'Search or type URL',
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(vertical: 10)),
      onFieldSubmitted: (value) {
        Providerfalse.updateSearchedText(value);

        Providerfalse.searchEngines();
      },
    );
  }
}
