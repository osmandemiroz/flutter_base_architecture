import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/mixin/home_view_mixin.dart';
import 'package:flutter_architecture_template/features/home/view_model/home_viewmodel.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/base/base_state.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_template/product/init/config/app_environment.dart';
import 'package:flutter_architecture_template/product/init/language/locale_keys.g.dart';
import 'package:flutter_architecture_template/product/init/product_localization.dart';
import 'package:flutter_architecture_template/product/navigation/app_router.dart';
import 'package:flutter_architecture_template/product/padding/project_padding.dart';
import 'package:flutter_architecture_template/product/utility/constants/enums/locales.dart';
import 'package:flutter_architecture_template/product/widget/button/bold_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

part 'widget/home_app_bar.dart';

@RoutePage()

/// The HomeView class is a stateful widget in Dart.
final class HomeView extends StatefulWidget {
  /// The line `const HomeView({super.key});` is defining a constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  final List<User> _users = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await homeViewModel.fetchUser();
            productViewModel.changeTheme(themeMode: ThemeMode.dark);
            homeViewModel.changeLoading();
            // _users = await loginService.users();
            // setState(() {});

            ///  SuccessDialog.show(title: 'title', context: context);
          },
        ),
        appBar: const _HomeAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const ProjectPadding.allLarge(),
              child: BoldTextButton(
                onPressed: () {},
                child: Text(LocaleKeys.home_title.tr()),
              ),
            ),
            // Assets.icons.icLove.svg(
            //   package: 'gen',
            // ),
            Text(''.ext.version),
            Text(
              ''.ext.appName,
              style: context.general.textTheme.displayLarge,
            ),
            Container(
              color: context.general.appTheme.primaryColorDark,
              width: context.sized.dynamicHeight(0.6),
              height: context.sized.dynamicHeight(0.1),
            ),
            // Assets.images.imgFlags.image(
            //   package: 'gen',
            // ),
            const CustomNetworkImage(
              size: Size(100, 200),
              imageUrl: '',
            ),
            ElevatedButton(
              onPressed: () {
                context.router.push(HomeDetailRoute(id: 'secret'));
              },
              child: Text(AppEnvironmentItems.baseUrl.value),
            ),
            const Text('change language'),
            ElevatedButton(
              onPressed: () => ProductLocalization.updateLanguage(
                context: context,
                value: Locales.tr,
              ),
              child: Text(
                LocaleKeys.general_button_save,
                style: context.general.textTheme.headlineLarge,
              ).tr(),
            ),
            const Expanded(
              child: _UserList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state[index].userId.toString()),
                subtitle: Text(state[index].body.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
