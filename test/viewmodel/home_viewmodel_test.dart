import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_architecture_template/features/home/view_model/home_viewmodel.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/login_service_mock.dart';
import 'mock/user_cache_mock.dart';

void main() {
  late HomeViewModel homeViewModel;
  setUp(
    () {
      homeViewModel = HomeViewModel(
        userCacheOperation: UserCacheMock(),
        authOperation: LoginServiceMock(),
      );
    },
  );

  group('HomeViewModel test', () {
    test('initial state', () {
      expect(homeViewModel.state.isLoading, false);
    });

    blocTest<HomeViewModel, HomeState>(
      'change loading state',
      build: () => homeViewModel,
      act: (bloc) => bloc.changeLoading(),
      expect: () => [
        isA<HomeState>().having((state) => state.isLoading, 'is loading', true),
      ],
    );
    blocTest<HomeViewModel, HomeState>(
      'fetch user',
      build: () => homeViewModel,
      act: (bloc) async => bloc.fetchUser(),
      expect: () => [
        isA<HomeState>().having((state) => state.users, 'users', isNotEmpty),
      ],
    );

    test('check database', () async {
      await homeViewModel.fetchUser();
      expect(homeViewModel.usersFromCache, isNotEmpty);
    });
  });
}
