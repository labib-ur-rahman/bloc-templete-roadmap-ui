import 'package:go_router/go_router.dart';
import 'package:bloc_template_roadmap_ui/src/routing/global_navigator.dart';
import 'package:bloc_template_roadmap_ui/src/routing/app_routes.dart';

import 'package:bloc_template_roadmap_ui/src/features/auth/presentation/screens/login_screen.dart';
import 'package:bloc_template_roadmap_ui/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:bloc_template_roadmap_ui/src/features/auth/presentation/screens/forgot_password_screen.dart';

import 'package:bloc_template_roadmap_ui/src/features/home/presentation/screens/home_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/onboarding/presentation/screens/onboarding_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/learning_roadmap_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/project_foundations_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/screens/roadmap_lesson_page.dart';
import 'package:bloc_template_roadmap_ui/src/features/learning_roadmap/presentation/content/roadmap_lessons.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.roadmap,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.roadmap,
      name: 'roadmap',
      builder: (context, state) => const LearningRoadmapPage(),
    ),
    GoRoute(
      path: AppRoutes.projectFoundations,
      name: 'projectFoundations',
      builder: (context, state) => const ProjectFoundationsPage(),
    ),
    GoRoute(
      path: AppRoutes.appStartup,
      name: 'appStartup',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.startup),
    ),
    GoRoute(
      path: AppRoutes.designSystem,
      name: 'designSystem',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.design),
    ),
    GoRoute(
      path: AppRoutes.featureArchitecture,
      name: 'featureArchitecture',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.architecture),
    ),
    GoRoute(
      path: AppRoutes.blocStateManagement,
      name: 'blocStateManagement',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.bloc),
    ),
    GoRoute(
      path: AppRoutes.routingNavigation,
      name: 'routingNavigation',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.routing),
    ),
    GoRoute(
      path: AppRoutes.servicesFailures,
      name: 'servicesFailures',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.services),
    ),
    GoRoute(
      path: AppRoutes.productionWorkflow,
      name: 'productionWorkflow',
      builder: (context, state) =>
          const RoadmapLessonPage(lessonId: RoadmapLessonId.production),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
