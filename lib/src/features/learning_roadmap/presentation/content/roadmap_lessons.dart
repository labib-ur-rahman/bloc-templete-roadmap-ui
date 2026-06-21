import 'package:bloc_template_roadmap_ui/src/imports/imports.dart';

enum RoadmapLessonId {
  startup,
  design,
  architecture,
  bloc,
  routing,
  services,
  production,
}

class RoadmapLesson {
  const RoadmapLesson({
    required this.appBarKey,
    required this.moduleKey,
    required this.durationKey,
    required this.titleKey,
    required this.introKey,
    required this.outcomeKey,
    required this.icon,
    required this.concepts,
    required this.resources,
    required this.codeSampleLines,
    required this.steps,
    required this.ruleKeys,
    required this.practiceTitleKey,
    required this.practiceSubtitleKey,
    required this.practiceKeys,
  });

  final String appBarKey;
  final String moduleKey;
  final String durationKey;
  final String titleKey;
  final String introKey;
  final String outcomeKey;
  final IconData icon;
  final List<RoadmapLessonConcept> concepts;
  final List<RoadmapLessonResource> resources;
  final List<String> codeSampleLines;
  final List<RoadmapLessonStep> steps;
  final List<String> ruleKeys;
  final String practiceTitleKey;
  final String practiceSubtitleKey;
  final List<String> practiceKeys;
}

class RoadmapLessonConcept {
  const RoadmapLessonConcept({
    required this.icon,
    required this.titleKey,
    required this.bodyKey,
  });

  final IconData icon;
  final String titleKey;
  final String bodyKey;
}

class RoadmapLessonResource {
  const RoadmapLessonResource({
    required this.icon,
    required this.label,
    required this.descriptionKey,
  });

  final IconData icon;
  final String label;
  final String descriptionKey;
}

class RoadmapLessonStep {
  const RoadmapLessonStep({
    required this.label,
    required this.descriptionKey,
  });

  final String label;
  final String descriptionKey;
}

abstract final class RoadmapLessonCatalog {
  RoadmapLessonCatalog._();

  static RoadmapLesson byId(RoadmapLessonId id) {
    return switch (id) {
      RoadmapLessonId.startup => _startup,
      RoadmapLessonId.design => _design,
      RoadmapLessonId.architecture => _architecture,
      RoadmapLessonId.bloc => _bloc,
      RoadmapLessonId.routing => _routing,
      RoadmapLessonId.services => _services,
      RoadmapLessonId.production => _production,
    };
  }

  static const RoadmapLesson _startup = RoadmapLesson(
    appBarKey: 'startup.app_bar',
    moduleKey: 'startup.module',
    durationKey: 'startup.duration',
    titleKey: 'startup.title',
    introKey: 'startup.intro',
    outcomeKey: 'startup.outcome',
    icon: IconsaxPlusLinear.play_circle,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.play,
        titleKey: 'startup.concepts.entry.title',
        bodyKey: 'startup.concepts.entry.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.layer,
        titleKey: 'startup.concepts.shell.title',
        bodyKey: 'startup.concepts.shell.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.shield_tick,
        titleKey: 'startup.concepts.wrappers.title',
        bodyKey: 'startup.concepts.wrappers.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.code_1,
        label: 'lib/main.dart',
        descriptionKey: 'startup.resources.main',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.monitor,
        label: 'lib/src/app.dart',
        descriptionKey: 'startup.resources.app',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.translate,
        label: 'lib/src/shared/wrappers/localization_wrapper.dart',
        descriptionKey: 'startup.resources.localization',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.hierarchy,
        label: 'lib/src/shared/wrappers/state_wrapper.dart',
        descriptionKey: 'startup.resources.state',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.routing_2,
        label: 'lib/src/shared/wrappers/session_listener_wrapper.dart',
        descriptionKey: 'startup.resources.session',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.setting_2,
        label: 'lib/src/config/app_config.dart',
        descriptionKey: 'startup.resources.config',
      ),
    ],
    codeSampleLines: [
      'WidgetsFlutterBinding.ensureInitialized()',
      'FlutterNativeSplash.preserve(...)',
      'EasyLocalization.ensureInitialized()',
      "dotenv.load(fileName: '.env')",
      'AppConfig.init()',
      'runApp(LocalizationWrapper -> StateWrapper -> App)',
      'App -> ScreenUtilWrapper -> MaterialApp.router',
      'builder -> SkeletonWrapper -> SessionListenerWrapper',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Binding -> Splash',
        descriptionKey: 'startup.steps.binding',
      ),
      RoadmapLessonStep(
        label: 'Localization -> Dotenv -> Config',
        descriptionKey: 'startup.steps.services',
      ),
      RoadmapLessonStep(
        label: 'runApp wrappers',
        descriptionKey: 'startup.steps.run_app',
      ),
      RoadmapLessonStep(
        label: 'MaterialApp.router shell',
        descriptionKey: 'startup.steps.material',
      ),
      RoadmapLessonStep(
        label: 'Session resolution',
        descriptionKey: 'startup.steps.session',
      ),
    ],
    ruleKeys: [
      'startup.rules.fast',
      'startup.rules.order',
      'startup.rules.long_lived',
      'startup.rules.blocking',
      'startup.rules.splash',
    ],
    practiceTitleKey: 'startup.practice.title',
    practiceSubtitleKey: 'startup.practice.subtitle',
    practiceKeys: [
      'startup.practice.task_1',
      'startup.practice.task_2',
      'startup.practice.task_3',
      'startup.practice.task_4',
    ],
  );

  static const RoadmapLesson _design = RoadmapLesson(
    appBarKey: 'design.app_bar',
    moduleKey: 'design.module',
    durationKey: 'design.duration',
    titleKey: 'design.title',
    introKey: 'design.intro',
    outcomeKey: 'design.outcome',
    icon: IconsaxPlusLinear.colorfilter,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.brush_3,
        titleKey: 'design.concepts.semantic.title',
        bodyKey: 'design.concepts.semantic.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.rulerpen,
        titleKey: 'design.concepts.tokens.title',
        bodyKey: 'design.concepts.tokens.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.mobile,
        titleKey: 'design.concepts.responsive.title',
        bodyKey: 'design.concepts.responsive.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.paintbucket,
        label: 'lib/src/theme/theme.dart',
        descriptionKey: 'design.resources.theme',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.color_swatch,
        label: 'lib/src/theme/color_schemes.dart',
        descriptionKey: 'design.resources.colors',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.size,
        label: 'lib/src/theme/app_spacing.dart',
        descriptionKey: 'design.resources.spacing',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.path,
        label: 'lib/src/theme/app_borders.dart',
        descriptionKey: 'design.resources.borders',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.text,
        label: 'lib/src/extensions/context_extension.dart',
        descriptionKey: 'design.resources.context',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.card,
        label: 'lib/src/shared/widgets/app_card.dart',
        descriptionKey: 'design.resources.widgets',
      ),
    ],
    codeSampleLines: [
      'ThemeData(useMaterial3: true, ...)',
      'extensions: [AppColorsExtension, AppDesignTokens]',
      'context.colors / context.appColors',
      'AppSpacing.md / AppBorders.lg',
      '16.sp / 24.r for responsive scaling',
      'Shared widgets read tokens instead of hard-coded values',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Theme foundation',
        descriptionKey: 'design.steps.foundation',
      ),
      RoadmapLessonStep(
        label: 'Semantic access',
        descriptionKey: 'design.steps.access',
      ),
      RoadmapLessonStep(
        label: 'Responsive sizing',
        descriptionKey: 'design.steps.responsive',
      ),
      RoadmapLessonStep(
        label: 'Shared components',
        descriptionKey: 'design.steps.components',
      ),
      RoadmapLessonStep(
        label: 'Page assembly',
        descriptionKey: 'design.steps.pages',
      ),
    ],
    ruleKeys: [
      'design.rules.semantic',
      'design.rules.tokens',
      'design.rules.shared',
      'design.rules.test_modes',
      'design.rules.magic_numbers',
    ],
    practiceTitleKey: 'design.practice.title',
    practiceSubtitleKey: 'design.practice.subtitle',
    practiceKeys: [
      'design.practice.task_1',
      'design.practice.task_2',
      'design.practice.task_3',
      'design.practice.task_4',
    ],
  );

  static const RoadmapLesson _architecture = RoadmapLesson(
    appBarKey: 'architecture_lesson.app_bar',
    moduleKey: 'architecture_lesson.module',
    durationKey: 'architecture_lesson.duration',
    titleKey: 'architecture_lesson.title',
    introKey: 'architecture_lesson.intro',
    outcomeKey: 'architecture_lesson.outcome',
    icon: IconsaxPlusLinear.hierarchy_3,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.box,
        titleKey: 'architecture_lesson.concepts.feature.title',
        bodyKey: 'architecture_lesson.concepts.feature.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.layer,
        titleKey: 'architecture_lesson.concepts.layers.title',
        bodyKey: 'architecture_lesson.concepts.layers.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.share,
        titleKey: 'architecture_lesson.concepts.shared.title',
        bodyKey: 'architecture_lesson.concepts.shared.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.folder,
        label: 'lib/src/features/auth/',
        descriptionKey: 'architecture_lesson.resources.auth_feature',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.folder_2,
        label: 'lib/src/features/learning_roadmap/',
        descriptionKey: 'architecture_lesson.resources.roadmap_feature',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.data,
        label: 'auth/data/repositories/auth_repository_impl.dart',
        descriptionKey: 'architecture_lesson.resources.data',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.diagram,
        label: 'auth/domain/repositories/auth_repository.dart',
        descriptionKey: 'architecture_lesson.resources.domain',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.monitor_mobbile,
        label: 'auth/presentation/providers + screens',
        descriptionKey: 'architecture_lesson.resources.presentation',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.global,
        label: 'lib/src/shared/',
        descriptionKey: 'architecture_lesson.resources.shared',
      ),
    ],
    codeSampleLines: [
      'features/auth/',
      '  data/models + repositories',
      '  domain/entities + repositories',
      '  presentation/providers + screens',
      'shared/ only for true cross-feature code',
      'routing/ wires features into the app',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Route enters a feature',
        descriptionKey: 'architecture_lesson.steps.route',
      ),
      RoadmapLessonStep(
        label: 'Presentation asks for work',
        descriptionKey: 'architecture_lesson.steps.presentation',
      ),
      RoadmapLessonStep(
        label: 'Domain defines the contract',
        descriptionKey: 'architecture_lesson.steps.domain',
      ),
      RoadmapLessonStep(
        label: 'Data fulfills the contract',
        descriptionKey: 'architecture_lesson.steps.data',
      ),
      RoadmapLessonStep(
        label: 'Services touch the outside world',
        descriptionKey: 'architecture_lesson.steps.services',
      ),
    ],
    ruleKeys: [
      'architecture_lesson.rules.boundaries',
      'architecture_lesson.rules.shared',
      'architecture_lesson.rules.simple',
      'architecture_lesson.rules.dependencies',
      'architecture_lesson.rules.widgets',
    ],
    practiceTitleKey: 'architecture_lesson.practice.title',
    practiceSubtitleKey: 'architecture_lesson.practice.subtitle',
    practiceKeys: [
      'architecture_lesson.practice.task_1',
      'architecture_lesson.practice.task_2',
      'architecture_lesson.practice.task_3',
      'architecture_lesson.practice.task_4',
    ],
  );

  static const RoadmapLesson _bloc = RoadmapLesson(
    appBarKey: 'bloc_lesson.app_bar',
    moduleKey: 'bloc_lesson.module',
    durationKey: 'bloc_lesson.duration',
    titleKey: 'bloc_lesson.title',
    introKey: 'bloc_lesson.intro',
    outcomeKey: 'bloc_lesson.outcome',
    icon: IconsaxPlusLinear.data_2,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.send_1,
        titleKey: 'bloc_lesson.concepts.events.title',
        bodyKey: 'bloc_lesson.concepts.events.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.refresh_2,
        titleKey: 'bloc_lesson.concepts.state.title',
        bodyKey: 'bloc_lesson.concepts.state.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.notification_status,
        titleKey: 'bloc_lesson.concepts.effects.title',
        bodyKey: 'bloc_lesson.concepts.effects.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.activity,
        label: 'auth/presentation/providers/auth_bloc.dart',
        descriptionKey: 'bloc_lesson.resources.auth_bloc',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.activity,
        label: 'auth/presentation/providers/session_bloc.dart',
        descriptionKey: 'bloc_lesson.resources.session_bloc',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.login_1,
        label: 'auth/presentation/screens/login_screen.dart',
        descriptionKey: 'bloc_lesson.resources.login_screen',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.hierarchy,
        label: 'lib/src/shared/wrappers/state_wrapper.dart',
        descriptionKey: 'bloc_lesson.resources.state_wrapper',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.tick_circle,
        label: 'AGENTS.md bloc rules',
        descriptionKey: 'bloc_lesson.resources.agents',
      ),
    ],
    codeSampleLines: [
      'UI -> add(LoginRequested)',
      'emit(isLoading: true)',
      'await repository.login(...)',
      'result.fold(failure, success)',
      'emit(isLoading: false)',
      'Listener handles toast or navigation',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'User intent',
        descriptionKey: 'bloc_lesson.steps.intent',
      ),
      RoadmapLessonStep(
        label: 'Loading transition',
        descriptionKey: 'bloc_lesson.steps.loading',
      ),
      RoadmapLessonStep(
        label: 'Repository call',
        descriptionKey: 'bloc_lesson.steps.repository',
      ),
      RoadmapLessonStep(
        label: 'State output',
        descriptionKey: 'bloc_lesson.steps.output',
      ),
      RoadmapLessonStep(
        label: 'Side effects',
        descriptionKey: 'bloc_lesson.steps.effects',
      ),
    ],
    ruleKeys: [
      'bloc_lesson.rules.immutable',
      'bloc_lesson.rules.thin',
      'bloc_lesson.rules.listener',
      'bloc_lesson.rules.context',
      'bloc_lesson.rules.streams',
    ],
    practiceTitleKey: 'bloc_lesson.practice.title',
    practiceSubtitleKey: 'bloc_lesson.practice.subtitle',
    practiceKeys: [
      'bloc_lesson.practice.task_1',
      'bloc_lesson.practice.task_2',
      'bloc_lesson.practice.task_3',
      'bloc_lesson.practice.task_4',
    ],
  );

  static const RoadmapLesson _routing = RoadmapLesson(
    appBarKey: 'routing_lesson.app_bar',
    moduleKey: 'routing_lesson.module',
    durationKey: 'routing_lesson.duration',
    titleKey: 'routing_lesson.title',
    introKey: 'routing_lesson.intro',
    outcomeKey: 'routing_lesson.outcome',
    icon: IconsaxPlusLinear.routing_2,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.route_square,
        titleKey: 'routing_lesson.concepts.constants.title',
        bodyKey: 'routing_lesson.concepts.constants.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.map,
        titleKey: 'routing_lesson.concepts.router.title',
        bodyKey: 'routing_lesson.concepts.router.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.arrow_swap_horizontal,
        titleKey: 'routing_lesson.concepts.navigation.title',
        bodyKey: 'routing_lesson.concepts.navigation.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.text_block,
        label: 'lib/src/routing/app_routes.dart',
        descriptionKey: 'routing_lesson.resources.routes',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.routing,
        label: 'lib/src/routing/app_router.dart',
        descriptionKey: 'routing_lesson.resources.router',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.global,
        label: 'lib/src/routing/global_navigator.dart',
        descriptionKey: 'routing_lesson.resources.global',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.play_circle,
        label: 'lib/src/shared/wrappers/session_listener_wrapper.dart',
        descriptionKey: 'routing_lesson.resources.session',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.teacher,
        label: 'learning_roadmap_page.dart',
        descriptionKey: 'routing_lesson.resources.roadmap',
      ),
    ],
    codeSampleLines: [
      'AppRoutes.roadmap = \'/roadmap\'',
      'GoRoute(path: AppRoutes.roadmap, ...)',
      'context.push(AppRoutes.projectFoundations)',
      'context.go(AppRoutes.home)',
      'appRouter.go(...) for global redirect-style changes',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Declare path constants',
        descriptionKey: 'routing_lesson.steps.constants',
      ),
      RoadmapLessonStep(
        label: 'Register GoRoute builders',
        descriptionKey: 'routing_lesson.steps.register',
      ),
      RoadmapLessonStep(
        label: 'Choose push or go',
        descriptionKey: 'routing_lesson.steps.navigate',
      ),
      RoadmapLessonStep(
        label: 'Handle global routing decisions',
        descriptionKey: 'routing_lesson.steps.global',
      ),
      RoadmapLessonStep(
        label: 'Keep routes teachable',
        descriptionKey: 'routing_lesson.steps.maintain',
      ),
    ],
    ruleKeys: [
      'routing_lesson.rules.central',
      'routing_lesson.rules.push_go',
      'routing_lesson.rules.guards',
      'routing_lesson.rules.stable',
      'routing_lesson.rules.deeplink',
    ],
    practiceTitleKey: 'routing_lesson.practice.title',
    practiceSubtitleKey: 'routing_lesson.practice.subtitle',
    practiceKeys: [
      'routing_lesson.practice.task_1',
      'routing_lesson.practice.task_2',
      'routing_lesson.practice.task_3',
      'routing_lesson.practice.task_4',
    ],
  );

  static const RoadmapLesson _services = RoadmapLesson(
    appBarKey: 'services_lesson.app_bar',
    moduleKey: 'services_lesson.module',
    durationKey: 'services_lesson.duration',
    titleKey: 'services_lesson.title',
    introKey: 'services_lesson.intro',
    outcomeKey: 'services_lesson.outcome',
    icon: IconsaxPlusLinear.cloud_connection,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.cloud_add,
        titleKey: 'services_lesson.concepts.services.title',
        bodyKey: 'services_lesson.concepts.services.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.convertshape,
        titleKey: 'services_lesson.concepts.repositories.title',
        bodyKey: 'services_lesson.concepts.repositories.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.warning_2,
        titleKey: 'services_lesson.concepts.failures.title',
        bodyKey: 'services_lesson.concepts.failures.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.cloud_connection,
        label: 'lib/src/services/auth_service.dart',
        descriptionKey: 'services_lesson.resources.auth_service',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.setting_2,
        label: 'lib/src/config/app_config.dart',
        descriptionKey: 'services_lesson.resources.config',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.tick_circle,
        label: 'lib/src/utils/task_runner.dart',
        descriptionKey: 'services_lesson.resources.task_runner',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.close_circle,
        label: 'lib/src/utils/failure.dart',
        descriptionKey: 'services_lesson.resources.failure',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.arrow_right_3,
        label: 'auth/data/repositories/auth_repository_impl.dart',
        descriptionKey: 'services_lesson.resources.repository',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.global_search,
        label: 'lib/src/services/dio_service.dart',
        descriptionKey: 'services_lesson.resources.dio_service',
      ),
    ],
    codeSampleLines: [
      'runTask(() async { ... }, requiresNetwork: true)',
      'return left(NetworkFailure(...))',
      'return left(ServerFailure(...))',
      'FutureEither<AppUser?> checkAuthState()',
      'Repository maps Map<String, dynamic> -> AppUser',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Start from a use case',
        descriptionKey: 'services_lesson.steps.use_case',
      ),
      RoadmapLessonStep(
        label: 'Call a shared service',
        descriptionKey: 'services_lesson.steps.service',
      ),
      RoadmapLessonStep(
        label: 'Guard and catch',
        descriptionKey: 'services_lesson.steps.guard',
      ),
      RoadmapLessonStep(
        label: 'Map transport to domain',
        descriptionKey: 'services_lesson.steps.map',
      ),
      RoadmapLessonStep(
        label: 'Return explicit failures',
        descriptionKey: 'services_lesson.steps.returning',
      ),
    ],
    ruleKeys: [
      'services_lesson.rules.shared_dio',
      'services_lesson.rules.no_context',
      'services_lesson.rules.no_raw_errors',
      'services_lesson.rules.empty_catch',
      'services_lesson.rules.entities',
    ],
    practiceTitleKey: 'services_lesson.practice.title',
    practiceSubtitleKey: 'services_lesson.practice.subtitle',
    practiceKeys: [
      'services_lesson.practice.task_1',
      'services_lesson.practice.task_2',
      'services_lesson.practice.task_3',
      'services_lesson.practice.task_4',
    ],
  );

  static const RoadmapLesson _production = RoadmapLesson(
    appBarKey: 'production.app_bar',
    moduleKey: 'production.module',
    durationKey: 'production.duration',
    titleKey: 'production.title',
    introKey: 'production.intro',
    outcomeKey: 'production.outcome',
    icon: IconsaxPlusLinear.verify,
    concepts: [
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.tick_circle,
        titleKey: 'production.concepts.loop.title',
        bodyKey: 'production.concepts.loop.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.translate,
        titleKey: 'production.concepts.localization.title',
        bodyKey: 'production.concepts.localization.body',
      ),
      RoadmapLessonConcept(
        icon: IconsaxPlusLinear.security_safe,
        titleKey: 'production.concepts.safety.title',
        bodyKey: 'production.concepts.safety.body',
      ),
    ],
    resources: [
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.document_text,
        label: 'pubspec.yaml',
        descriptionKey: 'production.resources.pubspec',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.language_square,
        label: 'assets/translations/en.json + es.json',
        descriptionKey: 'production.resources.translations',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.code_circle,
        label: 'test/widget_test.dart',
        descriptionKey: 'production.resources.tests',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.search_status,
        label: 'analysis_options.yaml',
        descriptionKey: 'production.resources.analysis',
      ),
      RoadmapLessonResource(
        icon: IconsaxPlusLinear.setting_3,
        label: 'SETUP.md + AGENTS.md + DESIGN.md',
        descriptionKey: 'production.resources.guides',
      ),
    ],
    codeSampleLines: [
      'dart format lib test',
      'flutter analyze',
      'flutter test',
      'flutter pub run easy_localization:generate ...',
      'Verify assets, routes, and environment-sensitive behavior',
    ],
    steps: [
      RoadmapLessonStep(
        label: 'Make the change',
        descriptionKey: 'production.steps.change',
      ),
      RoadmapLessonStep(
        label: 'Register supporting files',
        descriptionKey: 'production.steps.register',
      ),
      RoadmapLessonStep(
        label: 'Run quality checks',
        descriptionKey: 'production.steps.quality',
      ),
      RoadmapLessonStep(
        label: 'Test the user flow',
        descriptionKey: 'production.steps.verify',
      ),
      RoadmapLessonStep(
        label: 'Document and hand off',
        descriptionKey: 'production.steps.handoff',
      ),
    ],
    ruleKeys: [
      'production.rules.analyze',
      'production.rules.localization',
      'production.rules.secrets',
      'production.rules.tests',
      'production.rules.notes',
    ],
    practiceTitleKey: 'production.practice.title',
    practiceSubtitleKey: 'production.practice.subtitle',
    practiceKeys: [
      'production.practice.task_1',
      'production.practice.task_2',
      'production.practice.task_3',
      'production.practice.task_4',
    ],
  );
}
