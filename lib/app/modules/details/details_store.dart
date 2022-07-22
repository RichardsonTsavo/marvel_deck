import 'package:mobx/mobx.dart';

part 'details_store.g.dart';

// ignore: library_private_types_in_public_api
class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {}
