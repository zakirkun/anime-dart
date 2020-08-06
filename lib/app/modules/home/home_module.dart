import 'package:anime_dart/app/modules/home/presentation/screens/latest/latest_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [Router("/", child: (_, i) => LatestScreen())];
}
