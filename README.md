📱 Projeto de Login e Cadastro (Flutter)
📌 Sobre o projeto
Esse projeto foi desenvolvido com o objetivo de praticar a criação de um fluxo de autenticação em Flutter.
A ideia foi simular um sistema simples de cadastro e login de usuários, sem usar backend, trabalhando apenas com dados em memória.
---
🚀 O que o app faz
Tela inicial (splash)
Cadastro de usuário
Login com validação
Mensagens de erro e sucesso
Navegação entre telas
Tela home após login
---
🧠 Como o projeto foi organizado
Eu utilizei uma organização baseada em MVVM, separando bem as responsabilidades:
Model: onde fica a estrutura dos dados (ex: usuário)
View: as telas do app (login, cadastro, home, splash)
ViewModel: onde fica a lógica (validação, login, cadastro, etc.)
Data: um mock simulando um “banco de dados”
Routes: controle de navegação entre as telas
O armazenamento dos usuários foi feito usando um mock em memória com padrão Singleton, ou seja, os dados ficam disponíveis enquanto o app estiver rodando.
---
🔄 Fluxo do aplicativo
O app começa na tela de splash
Depois de alguns segundos, vai para o login
O usuário pode:
Fazer login, se já tiver conta
Ir para a tela de cadastro
No cadastro:
Preenche nome, email e senha
Se o email já existir, aparece erro
Se estiver tudo certo, o usuário é cadastrado
Depois volta para o login
Faz login com os dados cadastrados
Se der certo, entra na tela home
---
🧩 Regras que implementei
Todos os campos são obrigatórios
Email precisa ser válido
Senha precisa ter pelo menos 6 caracteres
Não pode cadastrar dois usuários com o mesmo email
Só entra no sistema se o login estiver correto
---
🛠️ Tecnologias usadas
Flutter
Dart
Validatorless (para validar os campos)
---
▶️ Como rodar o projeto
Clonar o repositório:
```id="c1x8zs"
git clone SEU_LINK_AQUI
```
Entrar na pasta:
```id="p9v3lk"
cd projeto
```
Instalar dependências:
```id="k4m2wd"
flutter pub get
```
Rodar:
```id="t7q1bn"
flutter run
```
---
🎥 Fluxo demonstrado
Splash → Login → Cadastro → Login → Home
---
💡 Observação
Esse projeto não usa banco de dados real, foi feito só para prática mesmo.
Os dados são perdidos quando o app é fechado.
