import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:f_testing/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:f_testing/models/album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('HTTP OK', () async {
      final mockitoClient = MockClient();

      when(mockitoClient
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(mockitoClient), isA<Album>());

      test('HTTP EXCEPTION', () {
        final mockitoClient = MockClient();

        when(mockitoClient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        expect(fetchAlbum(mockitoClient), throwsException);
      });
    });

  });
}