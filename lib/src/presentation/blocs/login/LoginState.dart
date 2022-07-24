import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  final String? displayName;

  const LoginState({this.displayName});

  @override
  List<Object?> get props => [displayName];
}

class UninitializedState extends LoginState {
  const UninitializedState();
}

class AuthenticatedState extends LoginState {
  const AuthenticatedState(String displayName) : super(displayName: displayName);
}

class UnauthenticatedState extends LoginState {

  const UnauthenticatedState();
}
