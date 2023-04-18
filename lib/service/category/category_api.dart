import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:truyen_full/model/category.dart';
import 'package:truyen_full/service/api.dart';
part 'category_api.g.dart';

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String baseUrl}) = _CategoryApi;

  factory CategoryApi.client({bool? isLoading}) {
    return CategoryApi(
        ClientApi().init()..options.headers['isLoading'] = isLoading);
  }

  @GET('/category')
  Future<List<Category>> getCategory();
}
