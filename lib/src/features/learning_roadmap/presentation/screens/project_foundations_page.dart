import 'package:bloc_template_roadmap_ui/src/imports/imports.dart';

class ProjectFoundationsPage extends StatelessWidget {
  const ProjectFoundationsPage({super.key});

  static const _rootFiles = [
    _FileLesson('AGENTS.md', 'foundations.files.agents'),
    _FileLesson('DESIGN.md', 'foundations.files.design'),
    _FileLesson('SETUP.md', 'foundations.files.setup'),
    _FileLesson('architecture.md', 'foundations.files.architecture'),
    _FileLesson('pubspec.yaml', 'foundations.files.pubspec'),
    _FileLesson('analysis_options.yaml', 'foundations.files.analysis'),
    _FileLesson('assets/', 'foundations.files.assets'),
    _FileLesson('test/', 'foundations.files.test'),
  ];

  static const _sourceFolders = [
    _FileLesson('main.dart', 'foundations.folders.main'),
    _FileLesson('src/app.dart', 'foundations.folders.app'),
    _FileLesson('src/features/', 'foundations.folders.features'),
    _FileLesson('src/shared/', 'foundations.folders.shared'),
    _FileLesson('src/routing/', 'foundations.folders.routing'),
    _FileLesson('src/services/', 'foundations.folders.services'),
    _FileLesson('src/theme/', 'foundations.folders.theme'),
    _FileLesson('src/config/', 'foundations.folders.config'),
    _FileLesson('src/imports/', 'foundations.folders.imports'),
    _FileLesson('src/extensions/', 'foundations.folders.extensions'),
    _FileLesson('src/utils/', 'foundations.folders.utils'),
  ];

  static const _readOrder = [
    _StepLesson('AGENTS.md + DESIGN.md', 'foundations.order.guides'),
    _StepLesson('pubspec.yaml', 'foundations.order.dependencies'),
    _StepLesson('main.dart → app.dart', 'foundations.order.startup'),
    _StepLesson('routing/ → features/', 'foundations.order.flow'),
    _StepLesson('shared/ → services/ → utils/', 'foundations.order.support'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: 'foundations.app_bar'.tr()),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.pagePadding,
          AppSpacing.sm,
          AppSpacing.pagePadding,
          AppSpacing.xxxl,
        ),
        children: [
          const _LessonHero(),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '01',
            title: 'foundations.mental_model.title'.tr(),
            subtitle: 'foundations.mental_model.subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          const _MentalModel(),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '02',
            title: 'foundations.root_title'.tr(),
            subtitle: 'foundations.root_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          const _FileGuide(items: _rootFiles),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '03',
            title: 'foundations.source_title'.tr(),
            subtitle: 'foundations.source_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          const _CodeMap(),
          SizedBox(height: AppSpacing.md),
          const _FileGuide(items: _sourceFolders),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '04',
            title: 'foundations.order_title'.tr(),
            subtitle: 'foundations.order_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          const _ReadingOrder(steps: _readOrder),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '05',
            title: 'foundations.rules_title'.tr(),
            subtitle: 'foundations.rules_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          const _RulesCard(),
          SizedBox(height: AppSpacing.xl),
          const _PracticeCard(),
        ],
      ),
    );
  }
}

class _LessonHero extends StatelessWidget {
  const _LessonHero();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.primaryContainer, colors.secondaryContainer],
        ),
        borderRadius: AppBorders.xl,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _Pill(label: 'foundations.module'.tr()),
                const Spacer(),
                Icon(
                  IconsaxPlusLinear.clock,
                  size: 16.sp,
                  color: colors.onPrimaryContainer,
                ),
                SizedBox(width: AppSpacing.xs),
                Text(
                  'foundations.duration'.tr(),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              'foundations.title'.tr(),
              style: context.textTheme.headlineLarge?.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'foundations.intro'.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: colors.onPrimaryContainer.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),
            SizedBox(height: AppSpacing.lg),
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colors.surface.withValues(alpha: 0.7),
                borderRadius: AppBorders.lg,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IconsaxPlusLinear.flag,
                    color: colors.primary,
                    size: 22.sp,
                  ),
                  SizedBox(width: AppSpacing.ms),
                  Expanded(
                    child: Text(
                      'foundations.outcome'.tr(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.ms,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: AppBorders.full,
      ),
      child: Text(
        label,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.number,
    required this.title,
    required this.subtitle,
  });

  final String number;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(width: AppSpacing.ms),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MentalModel extends StatelessWidget {
  const _MentalModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ConceptCard(
          icon: IconsaxPlusLinear.folder_2,
          title: 'foundations.mental_model.root'.tr(),
          body: 'foundations.mental_model.root_body'.tr(),
        ),
        SizedBox(height: AppSpacing.sm),
        _ConceptCard(
          icon: IconsaxPlusLinear.code,
          title: 'foundations.mental_model.source'.tr(),
          body: 'foundations.mental_model.source_body'.tr(),
        ),
        SizedBox(height: AppSpacing.sm),
        _ConceptCard(
          icon: IconsaxPlusLinear.box,
          title: 'foundations.mental_model.feature'.tr(),
          body: 'foundations.mental_model.feature_body'.tr(),
        ),
      ],
    );
  }
}

class _ConceptCard extends StatelessWidget {
  const _ConceptCard({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: context.colors.tertiaryContainer,
              borderRadius: AppBorders.sm,
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: context.colors.onTertiaryContainer,
            ),
          ),
          SizedBox(width: AppSpacing.ms),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppSpacing.xs),
                Text(
                  body,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FileGuide extends StatelessWidget {
  const _FileGuide({required this.items});

  final List<_FileLesson> items;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var index = 0; index < items.length; index++) ...[
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IconsaxPlusLinear.document_code_2,
                    size: 18.sp,
                    color: context.colors.primary,
                  ),
                  SizedBox(width: AppSpacing.ms),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].path,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          items[index].descriptionKey.tr(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onSurfaceVariant,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (index != items.length - 1) const AppDivider(),
          ],
        ],
      ),
    );
  }
}

class _CodeMap extends StatelessWidget {
  const _CodeMap();

  static const _map = '''lib/
├── main.dart
└── src/
    ├── features/<feature>/
    ├── shared/
    ├── routing/
    ├── services/
    ├── theme/
    ├── config/
    ├── imports/
    ├── extensions/
    └── utils/''';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.inverseSurface,
        borderRadius: AppBorders.lg,
      ),
      child: Text(
        _map,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onInverseSurface,
          fontFamily: 'monospace',
          height: 1.5,
        ),
      ),
    );
  }
}

class _ReadingOrder extends StatelessWidget {
  const _ReadingOrder({required this.steps});

  final List<_StepLesson> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < steps.length; index++)
          Padding(
            padding: EdgeInsets.only(
              bottom: index == steps.length - 1 ? 0 : AppSpacing.sm,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32.r,
                  height: 32.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colors.onPrimaryContainer,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.ms),
                Expanded(
                  child: AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          steps[index].label,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          steps[index].descriptionKey.tr(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onSurfaceVariant,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _RulesCard extends StatelessWidget {
  const _RulesCard();

  static const _ruleKeys = [
    'foundations.rules.feature',
    'foundations.rules.shared',
    'foundations.rules.naming',
    'foundations.rules.barrel',
    'foundations.rules.packages',
    'foundations.rules.generated',
  ];

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: context.colors.secondaryContainer.withValues(alpha: 0.45),
      child: Column(
        children: _ruleKeys
            .map(
              (key) => Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      IconsaxPlusLinear.tick_circle,
                      size: 20.sp,
                      color: context.appColors.success,
                    ),
                    SizedBox(width: AppSpacing.ms),
                    Expanded(
                      child: Text(
                        key.tr(),
                        style: context.textTheme.bodyMedium?.copyWith(
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  const _PracticeCard();

  static const _taskKeys = [
    'foundations.practice.task_1',
    'foundations.practice.task_2',
    'foundations.practice.task_3',
    'foundations.practice.task_4',
  ];

  @override
  Widget build(BuildContext context) {
    return AppCard(
      showShadow: true,
      color: context.colors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            IconsaxPlusLinear.medal_star,
            color: context.colors.onPrimary,
            size: 32.sp,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'foundations.practice.title'.tr(),
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: AppSpacing.xs),
          Text(
            'foundations.practice.subtitle'.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onPrimary.withValues(alpha: 0.8),
              height: 1.45,
            ),
          ),
          SizedBox(height: AppSpacing.md),
          for (final key in _taskKeys)
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IconsaxPlusLinear.arrow_right_1,
                    color: context.colors.onPrimary,
                    size: 16.sp,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      key.tr(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'foundations.practice.button'.tr(),
            onPressed: () => context.pop(),
            variant: ButtonVariant.secondary,
            isFullWidth: true,
            suffixIcon: Icon(IconsaxPlusLinear.arrow_left, size: 18.sp),
          ),
        ],
      ),
    );
  }
}

class _FileLesson {
  const _FileLesson(this.path, this.descriptionKey);

  final String path;
  final String descriptionKey;
}

class _StepLesson {
  const _StepLesson(this.label, this.descriptionKey);

  final String label;
  final String descriptionKey;
}
