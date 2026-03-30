import 'package:flutter/material.dart';
import 'package:projeto02/app/data/usuario_mock_store.dart';
import 'package:projeto02/features/auth/model/user_model.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  final UsuarioMockStore _store = UsuarioMockStore();

  String? nameValidator(String? value) {
    return Validatorless.required('Nome é obrigatório')(value);
  }

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

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) return false;

    isLoading = true;
    notifyListeners();

    // Simulating delay
    await Future.delayed(const Duration(seconds: 1));

    if (_store.usuarioExiste(emailController.text)) {
      isLoading = false;
      notifyListeners();
      return false;
    }

    final newUser = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    _store.adicionarUsuario(newUser);

    isLoading = false;
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
