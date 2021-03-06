import 'package:choosing_door_game/application/common/extensions/box_game_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:choosing_door_game/application/infrastructure/stores/home_store.dart';
import 'package:choosing_door_game/presentation/home/widgets/bottom_sheet.dart';
import 'package:choosing_door_game/application/common/extensions/game_stage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeStore _homeStore = Inject.instance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha Uma Maleta"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          InkWell(
            onTap: () {
              _homeStore.reset();
            },
            child: Icon(Icons.replay),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              int _boxes = await showModalBottomSheet<int>(
                  context: context,
                  builder: (_) {
                    return BottomSheetAmountChoose();
                  });
              setState(() {
                _homeStore = HomeStore(boxes: _boxes);
              });
            },
            child: Icon(Icons.settings),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(builder: (context) {
                return Center(
                  child: GridView(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, childAspectRatio: 1),
                    children: List.generate(
                      _homeStore.boxAmount,
                      (i) {
                        int _box = i + 1;

                        return InkWell(
                          onTap: () {
                            if (_homeStore.options.contains(_box)) {
                              _homeStore.makeChoice(_box);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(10),
                            // color: _box == _homeStore.yourChoice
                            //     ? Colors.green
                            //     : _homeStore.options.contains(_box)
                            //         ? Colors.amber
                            //         : Colors.red,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Icon(
                                  BoxGameIcons.suitcase,
                                  size: 50,
                                  color: _box == _homeStore.yourChoice
                                      ? Colors.green
                                      : _homeStore.options.contains(_box)
                                          ? Colors.black54
                                          : Colors.red,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, left:3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      _homeStore.options.contains(_box) ?
                                      Text(
                                        "$_box",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ) : Icon(Icons.close, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Observer(
                builder: (_) {
                  switch (_homeStore.stage) {
                    case GameStage.RemoveDoors:
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    "Vamos te dar um boi e remover 8 maletas SEM PRÊMIO, OK?"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: _homeStore.removePorts,
                            child: Text("Remover Maletas"),
                          ),
                        ],
                      );
                    case GameStage.CheckResult:
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    "E aí? Quer mudar de Porta, fiote? Ou vai continuar com a mesma?? Quando estiver pronto clique no botão abaixo..."),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: _homeStore.checkResult,
                            child: Text("Verificar Resultado"),
                          ),
                        ],
                      );
                    case GameStage.Win:
                      return Column(
                        children: <Widget>[
                          Icon(
                            BoxGameIcons.thumbs_up_alt,
                            color: Colors.green,
                            size: 35,
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Você Ganhou!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: _homeStore.reset,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.replay),
                                SizedBox(width: 5,),
                                Text("Jogar de Novo"),
                              ],
                            ),
                          ),
                        ],
                      );
                    case GameStage.Loss:
                      return Column(
                        children: <Widget>[
                          Icon(
                            BoxGameIcons.thumbs_up_alt,
                            color: Colors.red,
                            size: 35,
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Você Perdeu, Zé Mané!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: _homeStore.reset,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.replay),
                                SizedBox(width: 5,),
                                Text("Jogar de Novo"),
                              ],
                            ),
                          ),
                        ],
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
