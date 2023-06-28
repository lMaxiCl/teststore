import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/ui/pages/shop/bloc/shop_bloc.dart';
import 'package:teststore/ui/pages/shop/widgets/product_tile.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels == 0) {
    //     context.read<ShopBloc>().add(Refresh());
    //   }
    // });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<ShopBloc>().add(
              LoadMore(),
            );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if (state is ShopInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShopLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ShopBloc>().add(Refresh());
            },
            child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Manual refresh indicator looks better, but i decided to combine built in refresh and manual load more
                // if (state.isRefreshing)
                //   const SliverToBoxAdapter(
                //     child: Center(
                //         child: Padding(
                //       padding: EdgeInsets.all(5.0),
                //       child: CircularProgressIndicator(),
                //     )),
                //   ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 157 / 181),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProductTile(
                        product: state.products[index],
                      );
                    },
                    childCount: state.products.length,
                  ),
                ),
                if (state.products.length < state.totalProducts)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
