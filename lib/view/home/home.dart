import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_ui/provider/urlProvider.dart';
import 'package:mirror_wall_ui/utils/golbal.dart';
import 'package:mirror_wall_ui/view/compontents/bottomNavgationBar.dart';
import 'package:mirror_wall_ui/view/compontents/network_issue.dart';
import 'package:mirror_wall_ui/view/compontents/popbutton.dart';
import 'package:mirror_wall_ui/view/compontents/textfiled.dart';
import 'package:provider/provider.dart';

PullToRefreshController pullToRefreshController = PullToRefreshController(
  onRefresh: () {
    inAppWebViewController.reload();
  },
);

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider Providertrue =
        Provider.of<MainProvider>(context, listen: true);
    MainProvider Providerfalse =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Browser',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [
          PopUpofAppBar(),
        ],
        // bottom:
      ),
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.data!.contains(ConnectivityResult.mobile) ||
                snapshot.data!.contains(ConnectivityResult.wifi)) {
              return Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri('https://www.google.com/'),
                    ),
                    onWebViewCreated: (controller) {
                      inAppWebViewController = controller;
                    },
                    onProgressChanged: (controller, progress) {
                      Providerfalse.onchange_progress(progress);
                    },
                    onUpdateVisitedHistory: (controller, url, isReload) {
                      Providerfalse.addtoHistory();
                    },
                    // for the add to fav site
                    onLoadStop: (controller, url) async {
                      Providerfalse.addtoHistory();
                      await Providerfalse.setcurrentUrl();
                      await Providerfalse.checkIfShouldGoBack();
                      await Providerfalse.canGoForward();
                      await pullToRefreshController.endRefreshing();
                    },
                    pullToRefreshController: pullToRefreshController,
                  ),
                  (Providertrue.progress < 1)
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: LinearProgressIndicator(
                            color: Colors.purple,
                            value: Providertrue.progress,
                          ),
                        )
                      : Container(),
                ],
              );
            } else {
              return const Center(
                child: offLine_Code(),
              );
            }
          }),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => SizedBox(
          height: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Header_TextFormField(),
              ),
              BottomNavBar(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
