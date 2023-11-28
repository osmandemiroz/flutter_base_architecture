import 'package:flutter_architecture_template/features/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_template/product/cache/model/user_cache_model.dart';
import 'package:flutter_architecture_template/product/services/interfaces/auth_operation.dart';
import 'package:flutter_architecture_template/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  ///default value initialized
  HomeViewModel({required AuthOperation authOperation})
      : _authOperation = authOperation,
        super(const HomeState(isLoading: false));
  late final AuthOperation _authOperation;

  ///change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> fetchUser() async {
    final response = await _authOperation.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  void _saveItems(List<User> user) {
    for (final element in user) {
      ProductStateItems.productCache.userCacheOperation
          .add(UserCacheModel(user: element));
    }
  }

  List<User>? get users => ProductStateItems.productCache.userCacheOperation
      .getAll()
      .map((e) => e.user)
      .toList();
}
