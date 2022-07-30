import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/model/all_pokemons/PokemonResults.dart';

class PokemonResultWidget extends StatelessWidget {
  final PokemonResult pokemonResult;
  final bool isRemovable;
  final void Function(PokemonResult pokemonResult)? onRemove;
  final void Function(PokemonResult pokemonResult) onPokemonResultPressed;

  const PokemonResultWidget({
    Key? key,
    required this.pokemonResult,
    required this.onPokemonResultPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: 90,
        child: Row(
          children: [
            _buildTitleAndDescription(),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              pokemonResult.name ?? 'no - name',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  pokemonResult.name ?? 'no - name' + '\'s description',
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Ionicons.trash_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onPokemonResultPressed != null) {
      onPokemonResultPressed(pokemonResult);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(pokemonResult);
    }
  }
}
