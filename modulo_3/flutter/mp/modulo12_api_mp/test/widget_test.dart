import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modulo12_api_mp/main.dart';

void main() {
  testWidgets('API REST smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppHttp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
