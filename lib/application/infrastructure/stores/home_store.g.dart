// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<int> _$yourChoiceComputed;

  @override
  int get yourChoice =>
      (_$yourChoiceComputed ??= Computed<int>(() => super.yourChoice)).value;

  final _$stageAtom = Atom(name: '_HomeStoreBase.stage');

  @override
  GameStage get stage {
    _$stageAtom.context.enforceReadPolicy(_$stageAtom);
    _$stageAtom.reportObserved();
    return super.stage;
  }

  @override
  set stage(GameStage value) {
    _$stageAtom.context.conditionallyRunInAction(() {
      super.stage = value;
      _$stageAtom.reportChanged();
    }, _$stageAtom, name: '${_$stageAtom.name}_set');
  }

  final _$_yourChoiceAtom = Atom(name: '_HomeStoreBase._yourChoice');

  @override
  int get _yourChoice {
    _$_yourChoiceAtom.context.enforceReadPolicy(_$_yourChoiceAtom);
    _$_yourChoiceAtom.reportObserved();
    return super._yourChoice;
  }

  @override
  set _yourChoice(int value) {
    _$_yourChoiceAtom.context.conditionallyRunInAction(() {
      super._yourChoice = value;
      _$_yourChoiceAtom.reportChanged();
    }, _$_yourChoiceAtom, name: '${_$_yourChoiceAtom.name}_set');
  }

  final _$goldPotAtom = Atom(name: '_HomeStoreBase.goldPot');

  @override
  int get goldPot {
    _$goldPotAtom.context.enforceReadPolicy(_$goldPotAtom);
    _$goldPotAtom.reportObserved();
    return super.goldPot;
  }

  @override
  set goldPot(int value) {
    _$goldPotAtom.context.conditionallyRunInAction(() {
      super.goldPot = value;
      _$goldPotAtom.reportChanged();
    }, _$goldPotAtom, name: '${_$goldPotAtom.name}_set');
  }

  final _$optionsAtom = Atom(name: '_HomeStoreBase.options');

  @override
  ObservableList<int> get options {
    _$optionsAtom.context.enforceReadPolicy(_$optionsAtom);
    _$optionsAtom.reportObserved();
    return super.options;
  }

  @override
  set options(ObservableList<int> value) {
    _$optionsAtom.context.conditionallyRunInAction(() {
      super.options = value;
      _$optionsAtom.reportChanged();
    }, _$optionsAtom, name: '${_$optionsAtom.name}_set');
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic makeChoice(int value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.makeChoice(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkResult() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.checkResult();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removePorts() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.removePorts();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'stage: ${stage.toString()},goldPot: ${goldPot.toString()},options: ${options.toString()},yourChoice: ${yourChoice.toString()}';
    return '{$string}';
  }
}
