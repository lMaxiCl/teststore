import 'package:flutter/material.dart';
import 'package:teststore/tools/auth.dart';

class ShopAppBar extends StatelessWidget with PreferredSizeWidget {
  const ShopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.15,
          MediaQuery.of(context).padding.top + 7.0,
          7.0,
          7.0,
        ),
        child: const SearchTextField(),
      ),
      leading: IconButton(
        //Inconsistent design. On design there is density_medium icon, but in task it described as "In app bar user can push “Log out button” and be navigated back to login"
        // icon: const Icon(Icons.density_medium),
        icon: const Icon(
          Icons.logout,
          color: Colors.black,
        ),
        onPressed: () {
          AuthManager().logout();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.black12,
        filled: true,
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
