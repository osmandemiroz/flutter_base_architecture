import 'package:flutter_bloc/flutter_bloc.dart';

///Base Cubit
abstract class BaseCubit<T extends Object> extends Cubit<T> {
  ///constructor for cubit
  BaseCubit(super.initialState);

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
