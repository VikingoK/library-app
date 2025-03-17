import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:librery_app/core/network/dio_http_client.dart';

part 'host_providers.g.dart';

@Riverpod(keepAlive: true)
DioHttpClient apiServiceBooks(Ref ref) {
  const host = 'https://api.itbook.store/1.0';
  final dioHttpClient = DioHttpClient.createDefaultDio(host);
  final apiServiceAlpha = DioHttpClient.alpha(
    dio: dioHttpClient,
  );
  return apiServiceAlpha;
}
