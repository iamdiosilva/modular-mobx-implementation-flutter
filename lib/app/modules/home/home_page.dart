import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Observer(
            builder: (_) => Switch(
              value: store.appStore.isDark,
              onChanged: (bool value) {
                store.appStore.changeTheme();
              },
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) =>
            Text('Theme Dark: ${store.appStore.isDark.toString()}'),
      ),
    );
  }
}
