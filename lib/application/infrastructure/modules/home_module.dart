import 'package:choosing_door_game/presentation/home/home.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:choosing_door_game/application/infrastructure/stores/home_store.dart';

String _modulePath = "home";

class HomeModule extends Module {

  static final routePaths = _Routes();

  @override
  String get path => _modulePath;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: HomeModule.routePaths.home,
          builder: (arg) => Home(),
          transitionType: RouteTransitionType.rightToLeft,
        ),
      ];

  @override
  List<Injector> get injections => [
    Injector<HomeStore>(inject: (_) => HomeStore()),
  ];
}

class _Routes{
  String get home => "home";
}