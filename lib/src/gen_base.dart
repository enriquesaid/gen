import 'dart:math';

// TODO: Wrong place
var text =
    'Teoria da Relatividade é a denominação dada ao conjunto de duas teorias científicas: a Relatividade Restrita e a Relatividade Geral. A Relatividade Especial é uma teoria publicada no ano de 1905 por Albert Einstein, concluindo estudos precedentes do físico neerlandês Hendrik Lorentz, entre outros. Ela substitui os conceitos independentes de espaço e tempo da Teoria de Newton pela ideia de espaço-tempo como uma entidade geométrica unificada. O espaço-tempo na relatividade especial consiste de uma variedade diferenciável de 4 dimensões, três espaciais e uma temporal, munida de uma métrica pseudo-riemanniana, o que permite que noções de geometria possam ser utilizadas. É nessa teoria, também, que surge a ideia de velocidade da luz invariante. O termo especial é usado porque ela é um caso particular do princípio da relatividade em que efeitos da gravidade são ignorados. Dez anos após a publicação da teoria especial, Einstein publicou a Teoria Geral da Relatividade, que é a versão mais ampla da teoria, em que os efeitos da gravitação são integrados, surgindo a noção de espaço-tempo curvo. Cor é como o cérebro interpreta os sinais eletro nervosos vindos do olho, resultantes da reemissão da luz vinda de um objeto que foi emitida por uma fonte luminosa por meio de ondas eletromagnéticas; e que corresponde à parte do espectro eletromagnético que é visível. A Cor não é um fenômeno físico. Um mesmo comprimento de onda pode ser percebido diferentemente por diferentes pessoas, ou seja, cor é um fenômeno fisiológico, de caráter subjetivo e individual.';

class Generate {
  final _r = Random();

  bool boolean({int likelihood = 50}) => (likelihood < 0 || likelihood > 100)
      ? throw RangeError('argument \'likelihood\' accepts values from 0 to 100')
      : _r.nextDouble() * 100 < likelihood;

  int integer([max = 999]) => _r.nextInt(max);

  String title() {
    var words = integer(8);
    var data = text.split(' ')..shuffle(_r);
    var first = data.firstWhere((d) => RegExp('([A-Z][a-z0-9]+)+').hasMatch(d));
    var last = data.firstWhere((d) => RegExp('([.]+)+').hasMatch(d));
    var start = integer(data.length);
    var end = start + words;
    if (end > data.length) end = data.length;
    return [
      first.trim(),
      data
          .getRange(start, end)
          .where((s) => RegExp('^[^.]+\$').hasMatch(s))
          .toSet()
          .join(' ')
          .toLowerCase(),
      last.trim().toLowerCase(),
    ].join(' ').trim();
  }
}
