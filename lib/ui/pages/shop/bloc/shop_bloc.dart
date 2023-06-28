import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/data/product.dart';
import 'package:teststore/tools/repositories/shop_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository shopRepository;
  ShopBloc(this.shopRepository) : super(ShopInitial()) {
    on<LoadItems>(
      (event, emit) async {
        try {
          await shopRepository.getProducts(limit: event.limit).then((products) {
            emit(ShopLoaded(products));
          });
        } catch (e) {
          emit(
            ShopError(
              message: e.toString(),
            ),
          );
        }
      },
    );

    on<Refresh>((event, emit) {
      if (state is ShopLoaded) {
        emit(
          ShopLoaded(
            (state as ShopLoaded).products,
          ),
        );
        add(LoadItems());
      }
    });

    on<LoadMore>((event, emit) {
      if (state is ShopLoaded) {
        emit(
          ShopLoaded(
            (state as ShopLoaded).products,
          ),
        );
        add(LoadItems(limit: (state as ShopLoaded).products.length + 10));
      }
    });
  }
}
