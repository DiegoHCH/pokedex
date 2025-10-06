import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/infrastructure/datasources/dio_client.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});


final dioProvider = Provider((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return dioClient.dio;
});