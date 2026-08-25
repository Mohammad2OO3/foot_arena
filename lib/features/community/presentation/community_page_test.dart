import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:footarena/features/community/presentation/pages/community_page.dart';


void main() {
  testWidgets('إرسال ChangeTabEvent يتسبب في تغيير التبويب المعروض', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CommunityPage()));

    expect(find.text("Arena Pro Stadium"), findsOneWidget);

    await tester.tap(find.text("Players"));
    await tester.pump();

    expect(find.text("Alex Martinez"), findsOneWidget);
  });
}