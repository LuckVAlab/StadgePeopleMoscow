import 'package:flutter_test/flutter_test.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';

void main() {
  group('AuthResponse.calendar', () {
    Map<String, dynamic> baseJson() => <String, dynamic>{
          'token': 'mock_token',
          'userId': 'user_001',
          'name': 'Иван Петров',
          'email': 'ivan@example.com',
          'role': 'specialist',
        };

    test('парсит calendar из JSON с ключами-строками в Map<int, bool?>', () {
      // JSON-ключи всегда строки, даже если бэкенд хранит их как числа
      // (например, {1: true} сериализуется в {"1": true}).
      final json = baseJson()
        ..['calendar'] = <String, dynamic>{
          '1': true,
          '2': false,
          '15': true,
        };

      final user = AuthResponse.fromJson(json);

      expect(user.calendar, <int, bool?>{1: true, 2: false, 15: true});
    });

    test('парсит calendar с null-значениями (незанятые дни)', () {
      final json = baseJson()
        ..['calendar'] = <String, dynamic>{
          '1': null,
          '2': false,
        };

      final user = AuthResponse.fromJson(json);

      expect(user.calendar, <int, bool?>{1: null, 2: false});
    });

    test('calendar равен null, если поле отсутствует в JSON', () {
      final user = AuthResponse.fromJson(baseJson());

      expect(user.calendar, isNull);
    });

    test('round-trip toJson/fromJson сохраняет Map<int, bool?>', () {
      const user = AuthResponse(
        token: 'mock_token',
        userId: 'user_001',
        name: 'Иван Петров',
        email: 'ivan@example.com',
        role: 'specialist',
        calendar: <int, bool?>{1: true, 2: false, 15: null},
      );

      // toJson сериализует int-ключи в строки
      final json = user.toJson();
      expect(
          json['calendar'], <String, bool?>{'1': true, '2': false, '15': null});

      // fromJson парсит их обратно в int-ключи
      final restored = AuthResponse.fromJson(json);
      expect(restored.calendar, <int, bool?>{1: true, 2: false, 15: null});
    });
  });
}
