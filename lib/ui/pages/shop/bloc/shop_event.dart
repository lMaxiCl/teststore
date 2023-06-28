part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {}

class LoadItems extends ShopEvent {
  final int limit;

  LoadItems({this.limit = 10});

  @override
  List<Object?> get props => [limit];
}

class Refresh extends ShopEvent {
  @override
  List<Object?> get props => [];
}

class LoadMore extends ShopEvent {
  @override
  List<Object?> get props => [];
}
