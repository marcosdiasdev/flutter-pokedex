import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokemonService {
  static Future<Pokemon> fetchPokemon(int id) async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon/' + id.toString());

    if(response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load resource');
    }
  }
}
