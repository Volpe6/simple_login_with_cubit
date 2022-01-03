import 'package:cubit_login_sample/features/login/presentation/page/login_page.dart';
import 'package:cubit_login_sample/features/main/presentation/page/main_page.dart';
import 'package:flutter/material.dart';

/// Todas rotas disponiveis na aplicacao
class Routes {
  /// Tela de login e a tela principal da aplicacao.
  /// A tela principal eh acessada utilizando a mesma rota quando o usuario
  /// se encontra autenticado
  static const initial = '/';
  static const main    = '/main';
  
}

class AppRoutes {
  static final routes = {
    Routes.initial : (BuildContext context) => LoginPage(),
    Routes.main    : (BuildContext context) => MainPage()
  };
}