// Smoke test da Biblioteca de Alexandria.
//
// Verifica se o app inicializa corretamente na tela de busca,
// exibindo o título da AppBar e o campo de pesquisa.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:library_of_alexandria/main.dart';

void main() {
  testWidgets('App inicializa na tela de busca com campo de pesquisa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Biblioteca de Alexandria'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.star_rounded), findsOneWidget);
  });
}
