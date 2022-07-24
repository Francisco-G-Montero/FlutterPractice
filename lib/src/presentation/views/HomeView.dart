import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatibeendoing/src/config/utils/constants.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/login/LoginState.dart';
import 'package:whatibeendoing/src/presentation/widgets/NavigationDrawerWidget.dart';

import '../../core/bloc/BlocWithState.dart';
import '../../data/model/all_pokemons/PokemonResults.dart';
import '../../domain/entities/PokemonResultModel.dart';
import '../blocs/remote_all_pokemons/RemoteAllPokemonsBloc.dart';
import '../blocs/remote_all_pokemons/RemoteAllPokemonsEvent.dart';
import '../blocs/remote_all_pokemons/RemoteAllPokemonsState.dart';
import '../widgets/BottomLoader.dart';
import '../widgets/LocalPokemonResultWidget.dart';
import '../widgets/PokemonResultWidget.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    useEffect(() {
      scrollController.addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(scrollController, context),
      drawer: NavigationDrawerWidget(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(kMaterialAppTitle),
      centerTitle: true,
      backgroundColor: Colors.redAccent,
      actions: [
        IconButton(
            onPressed: () {
              context.read<LoginBloc>().add(LoggedOut());
            },
            icon: Icon(Ionicons.log_out_outline)),
      ],
    );
  }

  Widget _buildBody(ScrollController scrollController, BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is UnauthenticatedState) {
          Navigator.pushNamed(context, kLoginRoute);
        }
      },
      child: BlocListener<RemoteAllPokemonsBloc, RemoteAllPokemonsState>(
        listenWhen: ((previous, current) {
          if(previous is RemoteAllPokemonsDone && current is RemoteAllPokemonsDone){
            return previous.pokemonStates.switchToRemoteContent != current.pokemonStates.switchToRemoteContent;
          } else return previous.toString() != current.toString();
        }),
        listener: (_, state) {
          if (state is RemoteAllPokemonsDone) {
            if (state.pokemonStates.appMessage.isNotEmpty) {
              _ToastMessage(context, state.pokemonStates.appMessage);
            }
          }
        },
        child: BlocBuilder<RemoteAllPokemonsBloc, RemoteAllPokemonsState>(
          builder: (_, state) {
            if (state is RemoteAllPokemonsLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is RemoteAllPokemonsError) {
              return const Center(
                child: Icon(Ionicons.refresh),
              );
            }
            if (state is RemoteAllPokemonsDone) {
              if (!state.pokemonStates.switchToRemoteContent) {
                final allLocalPokemons = state.pokemonStates.allLocalPokemons;
                return _buildLocalPokemonResult(allLocalPokemons);
              } else {
                final allPokemons = state.pokemonStates.allApiPokemons;
                return _buildPokemonResult(scrollController, allPokemons, state.pokemonStates.noMoreRemoteData);
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _ToastMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Widget _buildPokemonResult(ScrollController? scrollController, List<PokemonResult> allPokemons,bool? noMoreData) {
    return ListView.builder(
      itemCount: allPokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return index >= allPokemons.length - 1
            ? BottomLoader()
            : PokemonResultWidget(
            pokemonResult: allPokemons[index],
            onPokemonResultPressed: (item) => _onPokemonPressed(context, item));
      },
      controller: scrollController,
    );
  }

  Widget _buildLocalPokemonResult(List<PokemonResultModel> allLocalPokemons) {
    return ListView.builder(
      itemCount: allLocalPokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return index >= allLocalPokemons.length - 1
            ? BottomLoader()
            : LocalPokemonResultWidget(
            pokemonResult: allLocalPokemons[index],
            onPokemonResultPressed: (item) => _onLocalPokemonPressed(context, item));
      },
    );
  }

  void _onScrollListener(BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteAllPokemonBloc = BlocProvider.of<RemoteAllPokemonsBloc>(context);
    final state = remoteAllPokemonBloc.blocProcessState;
    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      context.read<RemoteAllPokemonsBloc>().add(GetAllPokemons());
    }
  }

  void _onPokemonPressed(BuildContext context, PokemonResult pokemonResults) {
    Navigator.pushNamed(context, kRoutePokemonDetailView, arguments: pokemonResults.name);
  }

  void _onLocalPokemonPressed(BuildContext context, PokemonResultModel pokemonResults) {
    Navigator.pushNamed(context, kRoutePokemonDetailView, arguments: pokemonResults.name);
  }
}