// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomeState extends Equatable {
  const HomeState({required this.isLoading, this.users});

  final bool isLoading;
  final List<User>? users;

  @override
  List<Object?> get props => [isLoading, users];

  ///new case checker
  HomeState copyWith({bool? isLoading, List<User>? users}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
