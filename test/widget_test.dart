import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:bloc_template_roadmap_ui/src/app.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/learning_roadmap_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/project_foundations_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/roadmap_lesson_page.dart';
import 'package:bloc_template_roadmap_ui/src/shared/wrappers/state_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('opens roadmap and navigates to lesson screens', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('es')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const StateWrapper(child: App()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(LearningRoadmapPage), findsOneWidget);

    await tester.tap(find.text('Project foundations'));
    await tester.pumpAndSettle();

    expect(find.byType(ProjectFoundationsPage), findsOneWidget);

    await tester.tap(find.byIcon(IconsaxPlusLinear.arrow_left).first);
    await tester.pumpAndSettle();

    expect(find.byType(LearningRoadmapPage), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('App startup and wrappers'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(find.text('App startup and wrappers'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('App startup and wrappers'));
    await tester.pumpAndSettle();

    expect(find.byType(RoadmapLessonPage), findsOneWidget);
    expect(find.text('Understand how the app wakes up.'), findsOneWidget);
  });
}
