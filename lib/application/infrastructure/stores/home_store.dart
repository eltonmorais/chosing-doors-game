import 'dart:math' show Random;

import 'package:mobx/mobx.dart';
import 'package:choosing_door_game/application/common/extensions/game_stage.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final int boxes;
  Random _random = Random();

  _HomeStoreBase({this.boxes}) {
    _boxAmount = boxes ?? 10;
    goldPot = _randomizer();
    initializeBoxes();
  }

  @observable
  int _boxAmount;

  @observable
  GameStage stage = GameStage.Start;

  @observable
  int _yourChoice;

  @observable
  int goldPot;

  @observable
  ObservableList<int> options = ObservableList<int>();

  @computed
  int get boxAmount => _boxAmount;

  @computed
  int get yourChoice => _yourChoice;

  @action
  initializeBoxes() {
    options.clear();
    int _current = 1;
    while (_current <= boxAmount) {
      options.add(_current);
      _current++;
    }
  }

  @action
  makeChoice(int value) {
    switch (stage) {
      case GameStage.CheckResult:
        _yourChoice = value;
        break;
      default:
        _yourChoice = value;
        stage = GameStage.RemoveDoors;
    }
  }

  int _randomizer() {
    return _random.nextInt(_boxAmount - 1) + 1;
  }

  int _getRandomExcept() {
    int _return;

    while (_return == null) {
      int _try = _randomizer();
      if (_try != yourChoice && _try != goldPot) {
        _return = _try;
      }
    }

    return _return;
  }

  @action
  checkResult() {
    if (yourChoice == goldPot) {
      stage = GameStage.Win;
    } else {
      stage = GameStage.Loss;
    }
  }

  @action
  reset() {
    _yourChoice = null;
    goldPot = _randomizer();
    initializeBoxes();
    stage = GameStage.Start;
  }

  @action
  removePorts() {
    List<int> _available = [];
    _available.add(yourChoice);

    if (_available.contains(goldPot)) {
      _available.add(_getRandomExcept());
    } else {
      _available.add(goldPot);
    }

    options.clear();
    options.addAll(_available);

    stage = GameStage.CheckResult;
  }
}
