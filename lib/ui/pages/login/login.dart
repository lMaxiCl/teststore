import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/tools/auth.dart';
import 'package:teststore/ui/pages/login/widgets/log_in_view.dart';

import 'bloc/log_in_bloc.dart';

class LogInScaffold extends StatelessWidget {
  const LogInScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<LogInBloc>(
          create: (context) => LogInBloc(
            AuthManager(),
          ),
          child: const LogInView(),
        ),
      ),
    );
  }
}
