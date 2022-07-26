import '../../../shared/failures/failures.dart';

abstract class ProductError implements Failure {}

class ProductInvalid extends ProductError {}

class ProductDatasourceInternetConnection implements NoInternetConnection {}

class ProductDatasourceError extends Failure {
  ProductDatasourceError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class ProductRepositoryError extends Failure {
  ProductRepositoryError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
