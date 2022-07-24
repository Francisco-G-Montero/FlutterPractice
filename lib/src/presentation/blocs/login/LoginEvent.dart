import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends LoginEvent {
  const AppStarted();
}

class LoggedIn extends LoginEvent {
  const LoggedIn();
}

class LoggedOut extends LoginEvent {
  const LoggedOut();
}

class LoginWithGooglePressed extends LoginEvent {
  const LoginWithGooglePressed();
}
