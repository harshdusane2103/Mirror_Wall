import 'package:flutter/material.dart';
import 'package:mirror_wall_ui/provider/urlProvider.dart';
import 'package:mirror_wall_ui/view/histroypage.dart';
import 'package:provider/provider.dart';

class PopUpofAppBar extends StatelessWidget {
  const PopUpofAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainProvider Providertrue =
        Provider.of<MainProvider>(context, listen: true);
    MainProvider Providerfalse =
        Provider.of<MainProvider>(context, listen: false);
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 'History') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HistoryScreen(),
          ));
        } else if (value == 'Engine') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Search Engines"),
                content: Container(
                  height: 240,
                  width: 400,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => RadioListTile(
                            title: Text(Providertrue.searchEngineNames[index]),
                            value: Providertrue.searchEngineNames[index],
                            groupValue: Providertrue.groupValue,
                            onChanged: (value) {
                              Providerfalse.updateSearchEngineGroupValue(
                                  value!);
                              Navigator.pop(context);
                              Providerfalse.updateSearchEngine(value!);

                              print(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        // PopupMenuItem(value: 'Feedback', child: Text('Feedback')),
        PopupMenuItem(value: 'History', child: Text('History')),
        PopupMenuItem(value: 'Engine', child: Text('Search Engine')),
      ],
    );
  }
}
