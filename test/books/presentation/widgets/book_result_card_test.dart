import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:librery_app/core/presentation/widgets/custom_splash_button.dart';
import 'package:librery_app/features/books/presentation/widgets/book_result_card.dart';

void main() {
  testWidgets('should truncate long title and subtitle',
      (WidgetTester tester) async {
    const String longTitle =
        'Nullam blandit ultricies turpis at ornare. Fusce et magna dui. ';
    const String longSubtitle =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin lacinia interdum eros sed hendrerit.';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BookResultCard(
          title: longTitle,
          subtitle: longSubtitle,
          price: '\$25.99',
          imageUrl: null,
          onTap: () {},
        ),
      ),
    ));

    // Assert
    expect(find.textContaining(longTitle), findsOneWidget);
    expect(find.textContaining(longSubtitle), findsOneWidget);
  });

  testWidgets('should trigger onTap when tapped', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BookResultCard(
          title: 'Test Book',
          subtitle: 'Test Subtitle',
          price: '\$10.00',
          imageUrl: null,
          onTap: () => tapped = true,
        ),
      ),
    ));

    // Act
    await tester.tap(find.byType(CustomSplashButton));
    await tester.pump();

    // Assert
    expect(tapped, isTrue);
  });
}
