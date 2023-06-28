import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/ui/pages/login/widgets/form.dart';

import '../bloc/log_in_bloc.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(child: SizedBox()),
          Center(
            child: Text(
              'eCommerce',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          LogInForm(
            usernameController: usernameController,
            passwordController: passwordController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LogInBloc>(context).add(
                LogIn(usernameController.text, passwordController.text),
              );
            },
            child: const Text('Log In'),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
