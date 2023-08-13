// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:todos_app/features/todo_list/data/datasource/todo_list_local_data_source.dart'
    as _i4;
import 'package:todos_app/features/todo_list/data/repositories/todo_list_repository_impl.dart'
    as _i6;
import 'package:todos_app/features/todo_list/domain/repositories/todo_list_repository.dart'
    as _i5;
import 'package:todos_app/features/todo_list/domain/usecases/get_todo_list.dart'
    as _i7;
import 'package:todos_app/features/todo_list/presentation/bloc/todo_list_bloc.dart'
    as _i8;
import 'package:todos_app/injection_container.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerSharedPreferences = _$RegisterSharedPreferences();
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => registerSharedPreferences.sh,
      preResolve: true,
    );
    gh.lazySingleton<_i4.TodoListLocalDataSource>(() =>
        _i4.TodoListLocalDataSourceImpl(
            sharedPreferences: gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i5.TodoListRepository>(
        () => _i6.TodoListRepositoryImpl(gh<_i4.TodoListLocalDataSource>()));
    gh.lazySingleton<_i7.GetTodoList>(
        () => _i7.GetTodoList(gh<_i5.TodoListRepository>()));
    gh.factory<_i8.TodoListBloc>(
        () => _i8.TodoListBloc(getTodoList: gh<_i7.GetTodoList>()));
    return this;
  }
}

class _$RegisterSharedPreferences extends _i9.RegisterSharedPreferences {}
