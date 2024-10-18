import 'package:flutter/material.dart';
import 'package:mirror_wall_ui/provider/urlProvider.dart';
import 'package:provider/provider.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider Providertrue =
    Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search History'),

      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: Provider.of<MainProvider>(context).historylist.length,
              itemBuilder: (context, index) {
                final item = Provider.of<MainProvider>(context).historylist[index];
                print(item);
                return Row(
               children: [
                 Text(Providertrue.historylist[index]),
               ],
    );
              }

                //   Card(
                //   elevation: 5,
                //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: ListTile(
                //     leading: Icon(
                //       Icons.link,
                //       color: Colors.blueAccent,
                //       size: 30,
                //     ),
                //     trailing: PopupMenuButton<String>(
                //       onSelected: (String value) {
                //
                //       },
                //       itemBuilder: (BuildContext context) {
                //         return {'Open', 'Delete', 'Share'}.map((String choice) {
                //           return PopupMenuItem<String>(
                //             value: choice,
                //             child: Text(choice),
                //           );
                //         }).toList();
                //       },
                //       icon: Icon(
                //         Icons.more_vert,
                //         color: Colors.blueAccent,
                //       ),
                //     ),
                //     title: Text(item,
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.black87,
                //       ),
                //     ),
                //     subtitle: Text('Visited on ${DateTime.now().toString()}',
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // );
              // },
            ),
          ),
        ),
      ),
    );
  }
}