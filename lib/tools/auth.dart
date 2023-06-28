import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthResultError {
  //level on which error occurred
  //StackTrace
  //message
  //etc
  final String error;

  AuthResultError(this.error);
}

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() {
    return _instance;
  }

  AuthManager._internal();

  final StreamController<bool> _loggedIn = StreamController<bool>.broadcast()
    ..onListen = () async {
      final prefs = await SharedPreferences.getInstance();
      final loggedIn = prefs.getBool('loggedIn') ?? false;
      _instance._loggedIn.add(loggedIn);
    };

  Stream<bool> get loggedInStream => _loggedIn.stream;

  Future<void> login(String username, String password) async {
    if (username == 'admin' && password == 'admin') {
      _loggedIn.add(true);
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedIn', true);
    } else {
      throw AuthResultError('Invalid username or password');
    }
  }

  Future<void> logout() async {
    _loggedIn.add(false);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
  }
}

class AuthShell extends StatefulWidget {
  final Widget child;
  const AuthShell(this.child, {Key? key}) : super(key: key);

  @override
  State<AuthShell> createState() => _AuthShellState();
}

class _AuthShellState extends State<AuthShell> {
  late final StreamSubscription<bool> authStateSubscription;

  @override
  void initState() {
    authStateSubscription = AuthManager().loggedInStream.listen((loggedIn) {
      if (!loggedIn) {
        context.go('/');
      } else {
        context.go('/shop');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
