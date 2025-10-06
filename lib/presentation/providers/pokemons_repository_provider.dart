import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/domain/domain.dart';
import 'package:pokemon_2025/infrastructure/infrastructure.dart';

final pokemonsRepositoryProvider = Provider<PokemonsRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return PokemonsRepositoryImpl(datasource: PokepiDatasource(dioClient: dioClient));
});