import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:librery_app/features/books/presentation/widgets/book_metadata.dart';
import 'package:librery_app/features/books/presentation/widgets/labeled_number.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';

void main() {
  Widget createWidgetUnderTest({String? websiteUrl}) {
    return MaterialApp(
      home: Scaffold(
        body: BookMetadata(
          rating: '4.5',
          numberOfPages: '350',
          year: '2023',
          paddingView: 10,
          websiteUrl: websiteUrl,
        ),
      ),
    );
  }

  testWidgets('Displays rating, number of pages, and year correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LabeledNumber), findsNWidgets(3));

    expect(find.text('Rating'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);

    expect(find.text('Num Pages'), findsOneWidget);
    expect(find.text('350'), findsOneWidget);

    expect(find.text('Year'), findsOneWidget);
    expect(find.text('2023'), findsOneWidget);
  });

  testWidgets('Does not display website button when websiteUrl is null',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(websiteUrl: null));

    expect(find.byType(CustomSplashButton), findsNothing);
    expect(find.text('Go to the website'), findsNothing);
  });
}
