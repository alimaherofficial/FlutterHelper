## Prompt to Create a Flow from Remote and Local Data Source to Cubit and Test in Flutter

### Instructions

You are an AI assistant tasked with generating a flow in Flutter that starts
from the remote and local data sources and ends at the cubit and test. The flow
should follow clean architecture principles and the repository pattern. The
generated code should be well-structured, maintainable, and testable.

### Requirements

1. **Entities and Models**:
   - Define the necessary entities and models to represent the data.
   - Ensure that the models can be converted to and from JSON for remote data
     source interactions and to and from database format for local data source
     interactions.

- use `equatable` package to compare the objects.
- Use the `@Collection` annotation from the `isar` package to define the
  entities if needed to save in local database.
- Use the `@ignore` annotation to ignore the `props` getter in the entities.

```dart
// Entity
@Collection(inheritance: false)
class OrderEntity extends Equatable {
  OrderEntity({
    this.id,
    this.createdAt,
    this.orderName,
    // ... other fields ...
  });

  final String? id;
  final DateTime? createdAt;
  final String? orderName;
  // ... other fields ...
  @ignore
  @override
  List<Object?> get props => [id, createdAt, orderName];
}

// Model
class OrderModel extends OrderEntity {
  OrderModel({
    super.id,
    super.createdAt,
    super.orderName,
    // ... other fields ...
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    orderName: json['order_name'] as String?,
    // ... other fields ...
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'order_name': orderName,
    // ... other fields ...
  };
}
```

2. **Data Sources**:
   - Create both remote and local data sources.
   - The remote data source should interact with an external API or service and
     implement the `RemoteDataSource` interface.
   - Use Dio for HTTP requests, Supabase for Database and Auth, and Firebase for
     Cloud Functions.
   ```dart
   // Remote Data Source Interface
   abstract class OrderRemoteDataSource {
     Future<List<OrderEntity>> fetchOrders();
   }

   // Remote Data Source Implementation
   @LazySingleton(as: OrderRemoteDataSource)
   class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
     OrderRemoteDataSourceImpl(this.httpClient);

     @override
     Future<List<OrderEntity>> fetchOrders() async {
       final response = await DioHelper.get(
         url: 'https://api.example.com/orders',
         queryParameters: {'limit': 10},
       );
       final orders = response.data.map((e) => OrderModel.fromJson(e)).toList();
       return orders;
     }

     // Supabase example
     /*
     @override
     Future<List<OrderEntity>> fetchOrders() async {
       final response = await supabase.from('orders').select().eq('user_id', userId);
       final orders = response.map((e) => OrderModel.fromJson(e)).toList();
       return orders;
     }
     */
   }
   ```

   - The local data source should interact with a local database or cache. Use
     Isar for the local data source.
   ```dart
   // Local Data Source Interface
   abstract class OrderLocalDataSource {
     Future<List<OrderEntity>> fetchOrders();
     Future<void> saveOrders(List<OrderEntity> orders);
   }

   // Local Data Source Implementation
   @LazySingleton(as: OrderLocalDataSource)
   class OrderLocalDataSourceImpl implements OrderLocalDataSource {
     OrderLocalDataSourceImpl(this.isar);

     @override
     Future<List<OrderEntity>> fetchOrders() async {
       return isar.orders.where().findAll();
     }

     @override
     Future<void> saveOrders(List<OrderEntity> orders) async {
       await isar.writeTxn(() async {
         await isar.orders.putAll(orders);
       });
     }
   }
   ```

3. **Repository**:
   - Create a repository that abstracts the data sources.
   - The repository should decide whether to fetch data from the remote or local
     data source based on certain conditions (e.g., network availability, data
     freshness).
   ```dart
   // Repository Interface
   abstract class OrderRepository {
     Future<Either<Failure, List<OrderEntity>>> fetchOrders();
     Future<Either<Failure, Unit>> saveOrders(List<OrderEntity> orders);
   }

   // Repository Implementation
   @LazySingleton(as: OrderRepository)
   class OrderRepositoryImpl implements OrderRepository {
     OrderRepositoryImpl(this._remoteDataSource, this._localDataSource);

     final OrderRemoteDataSource _remoteDataSource;
     final OrderLocalDataSource _localDataSource;

     @override
     Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
       try {
         final localOrders = await _localDataSource.fetchOrders();
         if (localOrders.isNotEmpty) {
           return Right(localOrders);
         }
         final remoteOrders = await _remoteDataSource.fetchOrders();
         await _localDataSource.saveOrders(remoteOrders);
         return Right(remoteOrders);
       } catch (e) {
         return Left(Failure.fromObject(e));
       }
     }

     @override
     Future<Either<Failure, Unit>> saveOrders(List<OrderEntity> orders) async {
       try {
         await _localDataSource.saveOrders(orders);
         return Right(unit);
       } catch (e) {
         return Left(Failure.fromObject(e));
       }
     }
   }
   ```

4. **Use Case**:
   - Create a use case that interacts with the repository.
   - The use case should encapsulate the business logic and be responsible for
     executing the required operations.
   - The use case should extend the `BaseUseCase` class from
     `base_usecase.dart`.
   - The use case should define the necessary parameters and return types.
   ```dart
   // Use Case
   @lazySingleton
   class FetchOrdersUseCase extends BaseUseCase<List<OrderEntity>, NoParameters> {
     FetchOrdersUseCase(this._repository);

     final OrderRepository _repository;

     @override
     Future<Either<Failure, List<OrderEntity>>> call(NoParameters parameters) async {
       return await _repository.fetchOrders();
     }
   }

   @lazySingleton
   class SaveOrdersUseCase extends BaseUseCase<Unit, List<OrderEntity>> {
     SaveOrdersUseCase(this._repository);

     final OrderRepository _repository;

     @override
     Future<Either<Failure, Unit>> call(List<OrderEntity> orders) async {
       return await _repository.saveOrders(orders);
     }
   }
   ```

5. **Cubit**:
   - Create a Cubit to manage the state of the UI.
   - The Cubit should interact with the use cases to fetch and save data.
   - Use the `freezed` package to manage the state.
   ```dart
   // Cubit State
   @freezed
   class OrderState with _$OrderState {
     const factory OrderState.initial() = _Initial;
     const factory OrderState.loading() = _Loading;
     const factory OrderState.loaded(List<OrderEntity> orders) = _Loaded;
     const factory OrderState.error(String message) = _Error;
   }

   // Cubit
   class OrderCubit extends Cubit<OrderState> {
     OrderCubit(this._fetchOrdersUseCase, this._saveOrdersUseCase) : super(const OrderState.initial());

     final FetchOrdersUseCase _fetchOrdersUseCase;
     final SaveOrdersUseCase _saveOrdersUseCase;

     Future<void> fetchOrders() async {
       emit(const OrderState.loading());
       final result = await _fetchOrdersUseCase(NoParameters());
       result.fold(
         (failure) => emit(OrderState.error(failure.message)),
         (orders) => emit(OrderState.loaded(orders)),
       );
     }

     Future<void> saveOrders(List<OrderEntity> orders) async {
       emit(const OrderState.loading());
       final result = await _saveOrdersUseCase(orders);
       result.fold(
         (failure) => emit(OrderState.error(failure.message)),
         (_) => fetchOrders(),
       );
     }
   }
   ```

6. **Dependency Injection**:
   - Use a dependency injection framework (e.g., get_it, injectable) to manage
     dependencies.
   - Ensure that the data sources, repository, use case, and cubit are properly
     injected.
   - Use `@lazySingleton` annotation to inject the dependencies or
     `@LazySingleton(as: Interface)` to inject the implementation.
   - run `dart run build_runner watch` to generate the code for the lazy
     singletons.

7. **Error Handling**:
   - Implement proper error handling mechanisms.
   - Use Either type from the dartz package to handle success and failure cases.

8. **Testing**:
   - Write unit tests for the data sources, repository, use case, and cubit.
   - Use mock data sources to simulate different scenarios.
   - Use mockito to create mock objects.
   - Use bloc_test to test cubit.
   ```dart
   import 'package:flutter_test/flutter_test.dart';
   import 'package:mockito/mockito.dart';
   import 'package:bloc_test/bloc_test.dart';

   class MockOrderRemoteDataSource extends Mock implements OrderRemoteDataSource {}
   class MockOrderLocalDataSource extends Mock implements OrderLocalDataSource {}
   class MockOrderRepository extends Mock implements OrderRepository {}
   class MockFetchOrdersUseCase extends Mock implements FetchOrdersUseCase {}
   class MockSaveOrdersUseCase extends Mock implements SaveOrdersUseCase {}

   void main() {
     group('OrderCubit', () {
       late MockFetchOrdersUseCase mockFetchOrdersUseCase;
       late MockSaveOrdersUseCase mockSaveOrdersUseCase;
       late OrderCubit orderCubit;

       setUp(() {
         mockFetchOrdersUseCase = MockFetchOrdersUseCase();
         mockSaveOrdersUseCase = MockSaveOrdersUseCase();
         orderCubit = OrderCubit(mockFetchOrdersUseCase, mockSaveOrdersUseCase);
       });

       blocTest<OrderCubit, OrderState>(
         'emits [loading, loaded] when fetchOrders is successful',
         build: () {
           when(mockFetchOrdersUseCase.call(NoParameters()))
               .thenAnswer((_) async => Right([OrderEntity(id: '1', orderName: 'Test Order')]));
           return orderCubit;
         },
         act: (cubit) => cubit.fetchOrders(),
         expect: () => [
           OrderState.loading(),
           OrderState.loaded([OrderEntity(id: '1', orderName: 'Test Order')]),
         ],
       );

       blocTest<OrderCubit, OrderState>(
         'emits [loading, error] when fetchOrders fails',
         build: () {
           when(mockFetchOrdersUseCase.call(NoParameters()))
               .thenAnswer((_) async => Left(Failure('Error')));
           return orderCubit;
         },
         act: (cubit) => cubit.fetchOrders(),
         expect: () => [
           OrderState.loading(),
           OrderState.error('Error'),
         ],
       );
     });
   }
   ```

### Example Structure

1. **Entities and Models**:
   - `lib/features/feature_name/domain/entities/entity.dart`
   - `lib/features/feature_name/data/models/model.dart`

2. **Data Sources**:
   - `lib/features/feature_name/data/datasources/remote_data_source.dart`
   - `lib/features/feature_name/data/datasources/local_data_source.dart`

3. **Repository**:
   - `lib/features/feature_name/data/repositories/repository_impl.dart`
   - `lib/features/feature_name/domain/repositories/repository.dart`

4. **Use Case**:
   - `lib/features/feature_name/domain/usecases/use_case_name1.dart`
   - `lib/features/feature_name/domain/usecases/use_case_name2.dart`

5. **Cubit**:
   - `lib/features/feature_name/presentation/cubit/order_cubit.dart`
   - `lib/features/feature_name/presentation/cubit/order_state.dart`

6. **Testing**:
   - `test/features/feature_name/data/datasources/remote_data_source_test.dart`
   - `test/features/feature_name/data/datasources/local_data_source_test.dart`
   - `test/features/feature_name/data/repositories/repository_impl_test.dart`
   - `test/features/feature_name/domain/usecases/use_case_test.dart`
   - `test/features/feature_name/presentation/cubit/cubit_test.dart`

### Additional Notes

- Follow Dart and Flutter best practices.
- Ensure that the code is clean, readable, and well-documented.
- Use meaningful names for classes, methods, and variables.
- Avoid deeply nested structures and keep the widget tree shallow.

By following these instructions, you will create a robust and maintainable flow
from the remote and local data sources to the cubit and test.
