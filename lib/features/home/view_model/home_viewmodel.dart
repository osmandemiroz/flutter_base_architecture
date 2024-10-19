import 'package:core/index.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_template/product/cache/model/user_cache_model.dart';
import 'package:flutter_architecture_template/product/services/interfaces/auth_operation.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

///HomeView Model
final class HomeViewModel extends BaseCubit<HomeState> {
  ///default value initialized
  HomeViewModel({
    required AuthOperation authOperation,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _authOperation = authOperation,
        _userCacheOperation = userCacheOperation,
        super(const HomeState(isLoading: false));
  final AuthOperation _authOperation;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  ///change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  ///fetch user
  Future<void> fetchUser() async {
    CustomLogger.showError<User>(usersFromCache);
    final response = await _authOperation.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  ///save items to cache
  void _saveItems(List<User> user) {
    for (final element in user) {
      _userCacheOperation.add(UserCacheModel(user: element));
    }
  }

  ///get users from cache
  List<User> get usersFromCache =>
      _userCacheOperation.getAll().map((e) => e.user).toList();
}
