import 'package:flutter/material.dart';
import 'package:projeto02/app/data/usuario_mock_store.dart';
import 'package:validatorless/validatorless.dart';

class LoginViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  final UsuarioMockStore _store = UsuarioMockStore();

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;

    isLoading = true;
    notifyListeners();

    // Simulating delay
    await Future.delayed(const Duration(seconds: 1));

    final user = _store.buscarUsuario(
      emailController.text,
      passwordController.text,
    );

    isLoading = false;
    notifyListeners();

    return user != null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
