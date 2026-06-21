/// Centralized route path constants for GoRouter.
///
/// Use these variables instead of raw strings throughout the app.
/// Example: `context.go(AppRoutes.onboarding)` instead of `context.go('/')`.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String roadmap = '/roadmap';
  static const String projectFoundations = '/roadmap/project-foundations';
  static const String appStartup = '/roadmap/app-startup';
  static const String designSystem = '/roadmap/design-system';
  static const String featureArchitecture =
      '/roadmap/feature-first-architecture';
  static const String blocStateManagement = '/roadmap/bloc-state-management';
  static const String routingNavigation = '/roadmap/routing-and-navigation';
  static const String servicesFailures = '/roadmap/data-services-and-errors';
  static const String productionWorkflow = '/roadmap/production-workflow';
}
