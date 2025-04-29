import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fam_controller/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.famEng).existsSync(), isTrue);
    expect(File(Images.famLogo).existsSync(), isTrue);
    expect(File(Images.fampay).existsSync(), isTrue);
  });
}
