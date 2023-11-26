part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        _loadingIndicator(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable
class _loadingIndicator extends StatelessWidget {
  const _loadingIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.isLoading) return const SizedBox.shrink();
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
