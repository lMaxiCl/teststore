import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:teststore/data/product.dart';

part 'shop_repository.g.dart';

@RestApi()
abstract class ShopRepository {
  factory ShopRepository(
    Dio dio, {
    String baseUrl,
  }) = _ShopRepository;

  @GET('/products?limit={limit}')
  Future<List<Product>> getProducts({@Path('limit') int limit});
}
