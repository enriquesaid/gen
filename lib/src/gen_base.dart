import 'dart:math';
import 'package:strings/strings.dart';
import 'data/texts/default.dart';

class Generate {
  final _r = Random();

  bool boolean({int likelihood = 50}) => (likelihood < 0 || likelihood > 100)
      ? throw RangeError('argument \'likelihood\' accepts values from 0 to 100')
      : _r.nextDouble() * 100 < likelihood;

  int integer([max = 999, min = 0]) {
    var i = _r.nextInt(max);
    return i < min ? min : i;
  }

  List<String> words() => dataTextsDefault.split(' ')..shuffle(_r);

  String firstWord() => capitalize(words()[0]).replaceAll('.', '');

  String lastWord() =>
      words().firstWhere((s) => RegExp('([+.])+').hasMatch(s)).toLowerCase();

  String title() {
    var data = words();
    var first = firstWord();
    var range = integer(7, 1);
    var start = integer(data.length);
    var end = start + range > data.length ? data.length : start + range;

    return [
      first,
      ...[data.first.toLowerCase(), ...data.sublist(1, data.length)]
          .getRange(start, end)
          .map((s) => s.length > 1 ? s : s.toLowerCase())
          .toSet()
          .where((s) => !s.contains(first) && RegExp('^[^.]+\$').hasMatch(s)),
      lastWord().replaceAll('.', ''),
    ].join(' ').trim();
  }

  String paragraph() {
    var p = capitalize((dataTextsDefault.split('. ')..shuffle(_r))[0])
        .replaceAll('.', '');
    return '$p.';
  }
}
