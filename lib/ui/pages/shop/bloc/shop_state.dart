part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {}

class ShopInitial extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopLoaded extends ShopState {
  final List<Product> products;
  final int totalProducts;
  final bool isRefreshing;

  ShopLoaded(this.products,
      {this.isRefreshing = false, this.totalProducts = 19});

  @override
  List<Object> get props => [products, totalProducts, isRefreshing];
}

class ShopError extends ShopState {
  final String? message;

  ShopError({this.message});
  @override
  List<Object?> get props => [message];
}
