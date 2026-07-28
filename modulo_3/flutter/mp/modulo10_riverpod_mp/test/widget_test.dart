import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modulo10_riverpod_mp/main.dart';

void main() {
  testWidgets('Riverpod smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppMonitoreo());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
