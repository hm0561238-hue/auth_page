import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Make sure to replace 'your_project_name' with your actual project name.
import 'package:your_project_name/main.dart';
import 'package:your_project_name/signin_screen.dart';
import 'package:your_project_name/signup_screen.dart';

void main() {
  // Test case for the Sign In Screen
  testWidgets('Sign In Screen renders correctly', (WidgetTester tester) async {
    // Pump the SignInScreen within a MaterialApp to provide necessary context.
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInScreen(),
      ),
    );

    // Verify that the "Welcome Back" text is present.
    expect(find.text('Welcome\nBack'), findsOneWidget);

    // Verify that there are exactly two TextField widgets (for email and password).
    expect(find.byType(TextField), findsNWidgets(2));

    // Verify that the "Sign In" ElevatedButton is present.
    expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);

    // Verify that the "Sign Up" TextButton is present.
    expect(find.widgetWithText(TextButton, 'Sign Up'), findsOneWidget);
  });

  // Test case to verify navigation from Sign In to Sign Up screen
  testWidgets('Navigate from Sign In to Sign Up screen', (WidgetTester tester) async {
    // Pump MyApp, which has the routes defined.
    await tester.pumpWidget(const MyApp());

    // Verify we are on the Sign In screen initially.
    expect(find.text('Welcome\nBack'), findsOneWidget);
    expect(find.text('Create\nAccount'), findsNothing); // Ensure we are not on sign-up yet.

    // Tap the "Sign Up" button on the Sign In screen.
    await tester.tap(find.widgetWithText(TextButton, 'Sign Up'));
    await tester.pumpAndSettle(); // Wait for navigation animations to complete.

    // Verify that we have successfully navigated to the Sign Up screen.
    expect(find.text('Create\nAccount'), findsOneWidget);
    expect(find.text('Welcome\nBack'), findsNothing); // Ensure we are no longer on sign-in.
  });

  // Test case for the Sign Up Screen
  testWidgets('Sign Up Screen renders correctly', (WidgetTester tester) async {
    // Pump the SignUpScreen within a MaterialApp.
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpScreen(),
      ),
    );

    // Verify that the "Create Account" text is present.
    expect(find.text('Create\nAccount'), findsOneWidget);

    // Verify that there are exactly three TextField widgets (username, email, password).
    expect(find.byType(TextField), findsNWidgets(3));

    // Verify that the "Sign Up" ElevatedButton is present.
    expect(find.widgetWithText(ElevatedButton, 'Sign Up'), findsOneWidget);

    // Verify that the "Sign In" TextButton is present.
    expect(find.widgetWithText(TextButton, 'Sign In'), findsOneWidget);
  });

  // Optional: Test navigation from Sign Up back to Sign In
  testWidgets('Navigate from Sign Up to Sign In screen', (WidgetTester tester) async {
    // Pump MyApp, which has the routes defined.
    await tester.pumpWidget(const MyApp());

    // Navigate to the Sign Up screen first.
    await tester.tap(find.widgetWithText(TextButton, 'Sign Up'));
    await tester.pumpAndSettle();

    // Verify we are on the Sign Up screen.
    expect(find.text('Create\nAccount'), findsOneWidget);

    // Tap the "Sign In" button on the Sign Up screen.
    await tester.tap(find.widgetWithText(TextButton, 'Sign In'));
    await tester.pumpAndSettle(); // Wait for navigation animations to complete.

    // Verify that we have successfully navigated back to the Sign In screen.
    expect(find.text('Welcome\nBack'), findsOneWidget);
    expect(find.text('Create\nAccount'), findsNothing);
  });
}