import 'package:choosing_door_game/application/infrastructure/stores/modal_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomSheetAmountChoose extends StatefulWidget {
  @override
  _BottomSheetAmountChooseState createState() =>
      _BottomSheetAmountChooseState();
}

class _BottomSheetAmountChooseState extends State<BottomSheetAmountChoose> {

  ModalStore _modalStore = ModalStore();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.red.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, _modalStore.boxAmount);
                    },
                    child: Text("Confirmar"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Escolha o número de maletas"),
                      ),
                    ],
                  ),
                  Container(
                    height: 55,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          int _currentNumber = i + 3;
                          return InkWell(
                            onTap: () {
                              _modalStore.boxAmount = _currentNumber;
                            },
                            child: Observer(builder: (context) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: _modalStore.boxAmount == _currentNumber
                                      ? Colors.cyan
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "$_currentNumber",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
