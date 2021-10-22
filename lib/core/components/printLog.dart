import 'dart:developer' as dev;

enum logColor {
  Green,
  Yellow,
  Red,
}

void logPrint({color = logColor.Green, String? text}) {
  switch (color) {
    case logColor.Yellow:
      {
        dev.log('\x1B[33m$text\x1B[0m');
      }
      break;

    case logColor.Red:
      {
        dev.log('\x1B[31m$text\x1B[0m');
      }
      break;

    case logColor.Green:
      {
        dev.log('\x1B[32m$text\x1B[0m');
      }
      break;
  }
}
