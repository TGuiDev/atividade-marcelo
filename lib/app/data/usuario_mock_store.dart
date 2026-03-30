import 'package:projeto02/features/auth/model/user_model.dart';

class UsuarioMockStore {
  // Singleton pattern
  static final UsuarioMockStore _instance = UsuarioMockStore._internal();
  factory UsuarioMockStore() => _instance;
  UsuarioMockStore._internal();

  final List<UserModel> _usuarios = [];

  void adicionarUsuario(UserModel usuario) {
    _usuarios.add(usuario);
  }

  UserModel? buscarUsuario(String email, String password) {
    try {
      return _usuarios.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  bool usuarioExiste(String email) {
    return _usuarios.any((u) => u.email == email);
  }

  List<UserModel> get usuarios => List.unmodifiable(_usuarios);
}
