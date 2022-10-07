import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';

// ignore: use_key_in_widget_constructors
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStore appController = Modular.get<AppStore>();
    return Observer(
      builder: (_) => (appController.theme != null)
          ? MaterialApp.router(
              title: 'Flutter Slidy',
              theme: appController.theme,
              routerDelegate: Modular.routerDelegate,
              routeInformationParser: Modular.routeInformationParser,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
