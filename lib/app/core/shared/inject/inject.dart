import 'package:get_it/get_it.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    // getIt.registerLazySingleton<GraphQLClient>(
    //   () => GraphQLClient(
    //     link: HttpLink(ApiConst.apiUrl),
    //     cache: GraphQLCache(),
    //   ),
    // );

    // getIt.registerLazySingleton<IHttpClientService>(
    //     () => GraphqlHttpClientServiceImp(getIt()));

    // getIt.registerLazySingleton<IBookRemoteDataSource>(
    //     () => BookRemoteDataSource(client: getIt()));

    // getI
    // getIt.registerLazySingleton<MyBooksController>(
    //   () => MyBooksController(getIt(), getIt()),
    // );

    // getIt.registerFactory<DetailController>(
    //   () => DetailController(getIt()),
    // );

    // getIt.registerFactory<HomeController>(
    //   () => HomeController(getIt()),
    // );

    // getIt.registerLazySingleton<CustomBottomNavigationBarController>(
    //   () => CustomBottomNavigationBarController(0),
    // );
  }
}
