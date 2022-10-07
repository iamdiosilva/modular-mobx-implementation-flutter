import 'package:mobx/mobx.dart';

import '../../app_store.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final AppStore appStore;

  HomeStoreBase(this.appStore);
}
