import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/ui/pages/login/bloc/log_in_bloc.dart';

class LogInForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const LogInForm(
      {required this.usernameController,
      required this.passwordController,
      Key? key})
      : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool isTextObscured = true;

  void toggleObscureText() {
    setState(() {
      isTextObscured = !isTextObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.usernameController,
          decoration: const InputDecoration(hintText: 'User Name'),
        ),
        TextField(
          controller: widget.passwordController,
          obscureText: isTextObscured,
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: IconButton(
              onPressed: toggleObscureText,
              icon: Icon(isTextObscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined),
            ),
          ),
        ),
        BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            if (state is LogInError) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const SizedBox();
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Forgot password?'),
          ),
        )
      ],
    );
  }
}
