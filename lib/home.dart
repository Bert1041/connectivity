import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network_aware_widget.dart';
import 'network_status_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Network Aware App"),
      ),
      body: StreamProvider<NetworkStatus>(
        initialData: NetworkStatus.online, // this line added !
        create: (context) =>
        NetworkStatusService().networkStatusController.stream,
        child: NetworkAwareWidget(
          onlineChild: const Center(
            child: Text(
              "I am online",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
          offlineChild: Center(
            child: Text(
              "No internet connection!",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}