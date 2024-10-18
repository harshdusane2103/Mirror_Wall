import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_ui/provider/urlProvider.dart';
import 'package:mirror_wall_ui/utils/golbal.dart';
import 'package:mirror_wall_ui/view/compontents/textfiled.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainProvider Providertrue =
        Provider.of<MainProvider>(context, listen: true);
    MainProvider Providerfalse =
        Provider.of<MainProvider>(context, listen: false);
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                inAppWebViewController.loadUrl(
                    urlRequest: URLRequest(
                  url: WebUri('https://www.google.com/'),
                ));
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Providerfalse.addtoHistory();
              },
              icon: const Icon(Icons.history_toggle_off_outlined)),

          // here is logic of back button

          IconButton(
              onPressed: Providertrue.isButtonEnabled
                  ? () {
                      (Providerfalse.goBack());
                    }
                  : null,
              icon: const Icon(Icons.chevron_left),
              iconSize: 30),
          IconButton(
            onPressed: () {
              inAppWebViewController.reload();
            },
            icon: const Icon(Icons.refresh),
            iconSize: 25,
          ),
          IconButton(
            onPressed:
                Provider.of<MainProvider>(context, listen: true).isButtonForward
                    ? () {
                        (Provider.of<MainProvider>(context, listen: false)
                            .goForward());
                      }
                    : null,
            icon: const Icon(Icons.chevron_right),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
