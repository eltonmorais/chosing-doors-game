import 'package:mobx/mobx.dart';
part 'modal_store.g.dart';

class ModalStore = _ModalStoreBase with _$ModalStore;

abstract class _ModalStoreBase with Store {
  
  @observable
  int boxAmount;
}
