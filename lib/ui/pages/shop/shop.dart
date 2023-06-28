import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/tools/network.dart';
import 'package:teststore/tools/repositories/shop_repository.dart';
import 'package:teststore/ui/pages/shop/bloc/shop_bloc.dart';
import 'package:teststore/ui/pages/shop/widgets/shop_app_bar.dart';
import 'package:teststore/ui/pages/shop/widgets/shop_view.dart';

class ShopScaffold extends StatelessWidget {
  const ShopScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopBloc>(
      create: (context) => ShopBloc(
        ShopRepository(NetworkManager().dio),
      )..add(LoadItems()),
      child: const Scaffold(
        appBar: ShopAppBar(),
        body: ShopView(),
      ),
    );
  }
}
