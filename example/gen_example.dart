import 'package:gen/gen.dart';

void main() {
  var gen = Generate();
  print('bool: ${gen.boolean()}');
  print('int: ${gen.integer()}');
  print('title: ${gen.title()}');
  print('paragraph: ${gen.paragraph()}');
}
