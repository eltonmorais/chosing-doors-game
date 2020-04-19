// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ModalStore on _ModalStoreBase, Store {
  final _$boxAmountAtom = Atom(name: '_ModalStoreBase.boxAmount');

  @override
  int get boxAmount {
    _$boxAmountAtom.context.enforceReadPolicy(_$boxAmountAtom);
    _$boxAmountAtom.reportObserved();
    return super.boxAmount;
  }

  @override
  set boxAmount(int value) {
    _$boxAmountAtom.context.conditionallyRunInAction(() {
      super.boxAmount = value;
      _$boxAmountAtom.reportChanged();
    }, _$boxAmountAtom, name: '${_$boxAmountAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'boxAmount: ${boxAmount.toString()}';
    return '{$string}';
  }
}
