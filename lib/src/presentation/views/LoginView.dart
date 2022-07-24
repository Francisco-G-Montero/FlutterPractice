import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginState.dart';
import 'package:whatibeendoing/src/presentation/views/SplashView.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF0FFFFFF),
        body: _LoginBody(context)
    );
  }
}

Widget _LoginBody(BuildContext context) {
  return BlocListener<LoginBloc, LoginState>(
    listener: (_, state) {
      if (state is AuthenticatedState) {
        Navigator.pushNamed(context, kRouteHome);
      }
    },
    child: BlocBuilder<LoginBloc, LoginState>(
      builder: (_, state) {
        if (state is UnauthenticatedState) {
          return _NotLoggedBody(context);
        } else if (state is UninitializedState) {
          return SplashView();
        }
        return SizedBox();
      },
    ),
  );
}

Padding _NotLoggedBody(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        FlutterLogo(size: 120),
        Spacer(),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Bienvenido a la aplicación de módulos para flutter",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Logueese en su cuenta para ingresar",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 48),
        ElevatedButton.icon(
          onPressed: () {
            context.read<LoginBloc>().add(LoginWithGooglePressed());
          },
          label: Text("Loguearse con Google"),
          style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
          icon: Icon(Ionicons.logo_google, color: Colors.white70,),
        ),
        Spacer(),
      ],
    ),
  );
}
