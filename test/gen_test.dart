import 'package:gen/gen.dart';
import 'package:test/test.dart';

void main() {
  group('base types tests', () {
    Generate gen;

    setUp(() {
      gen = Generate();
    });

    test('boolean() Test', () {
      expect(gen.boolean().runtimeType, bool);
    });

    test('boolean() true', () {
      expect(gen.boolean(likelihood: 100), true);
    });

    test('boolean() false', () {
      expect(gen.boolean(likelihood: 0), false);
    });
  });
}
