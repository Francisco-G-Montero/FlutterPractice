import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/domain/repository/LoginRepository.dart';
import 'package:whatibeendoing/src/domain/usecases/local/StoreLoginDateUseCase.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  final StoreLoginDateUseCase _storeLoginDateUseCase;

  LoginBloc(this._loginRepository, this._storeLoginDateUseCase) : super(const UninitializedState()) {
    on<AppStarted>(_AppStarted);
    on<LoggedIn>(_LoggedIn);
    on<LoggedOut>(_LoggedOut);
    on<LoginWithGooglePressed>((event, emit) async {
      await _loginRepository.signInWithGoogle();
      emit(AuthenticatedState(_loginRepository.getUserEmail()));
    });
  }

  FutureOr<void> _LoggedOut(event, emit) async {
    await _loginRepository.signOut();
    emit(UnauthenticatedState());
    _AppStarted;
  }

  FutureOr<void> _LoggedIn(event, emit) {
    emit(AuthenticatedState(_loginRepository.getUserEmail()));
  }

  FutureOr<void> _AppStarted(event, emit) async {
    try {
      final isSignedIn = await _loginRepository.isSignedIn();
      if (isSignedIn) {
        _storeLoginDateUseCase.storeLoginDate(DateTime.now().toString());
        final name = _loginRepository.getUserEmail();
        emit(AuthenticatedState(name));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (_) {
      emit(UnauthenticatedState());
    }
  }
}
