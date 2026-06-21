import 'package:bloc_template_roadmap_ui/src/imports/imports.dart';

import '../content/roadmap_lessons.dart';

class RoadmapLessonPage extends StatelessWidget {
  const RoadmapLessonPage({
    super.key,
    required this.lessonId,
  });

  final RoadmapLessonId lessonId;

  @override
  Widget build(BuildContext context) {
    final lesson = RoadmapLessonCatalog.byId(lessonId);

    return Scaffold(
      appBar: AppTopBar(title: lesson.appBarKey.tr()),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.pagePadding,
          AppSpacing.sm,
          AppSpacing.pagePadding,
          AppSpacing.xxxl,
        ),
        children: [
          _LessonHero(lesson: lesson),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '01',
            title: 'lesson.overview_title'.tr(),
            subtitle: 'lesson.overview_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          _ConceptList(lesson: lesson),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '02',
            title: 'lesson.resources_title'.tr(),
            subtitle: 'lesson.resources_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          _ResourceList(lesson: lesson),
          SizedBox(height: AppSpacing.md),
          _CodeSnapshot(lines: lesson.codeSampleLines),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '03',
            title: 'lesson.flow_title'.tr(),
            subtitle: 'lesson.flow_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          _StepList(lesson: lesson),
          SizedBox(height: AppSpacing.xl),
          _SectionHeading(
            number: '04',
            title: 'lesson.rules_title'.tr(),
            subtitle: 'lesson.rules_subtitle'.tr(),
          ),
          SizedBox(height: AppSpacing.md),
          _RuleList(lesson: lesson),
          SizedBox(height: AppSpacing.xl),
          _PracticeCard(lesson: lesson),
        ],
      ),
    );
  }
}

class _LessonHero extends StatelessWidget {
  const _LessonHero({required this.lesson});

  final RoadmapLesson lesson;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.primaryContainer, colors.tertiaryContainer],
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
                _Pill(label: lesson.moduleKey.tr()),
                const Spacer(),
                Icon(
                  IconsaxPlusLinear.clock,
                  size: 16.sp,
                  color: colors.onPrimaryContainer,
                ),
                SizedBox(width: AppSpacing.xs),
                Text(
                  lesson.durationKey.tr(),
                  style: context.textTheme.labelMedium?.copyWith(
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            Container(
              padding: EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colors.surface.withValues(alpha: 0.72),
                borderRadius: AppBorders.md,
              ),
              child: Icon(
                lesson.icon,
                size: 24.sp,
                color: colors.primary,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              lesson.titleKey.tr(),
              style: context.textTheme.headlineLarge?.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: FontWeight.w800,
                height: 1.1,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              lesson.introKey.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: colors.onPrimaryContainer.withValues(alpha: 0.82),
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
                    size: 22.sp,
                    color: colors.primary,
                  ),
                  SizedBox(width: AppSpacing.ms),
                  Expanded(
                    child: Text(
                      lesson.outcomeKey.tr(),
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

class _ConceptList extends StatelessWidget {
  const _ConceptList({required this.lesson});

  final RoadmapLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < lesson.concepts.length; index++) ...[
          _ConceptCard(concept: lesson.concepts[index]),
          if (index != lesson.concepts.length - 1)
            SizedBox(height: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _ConceptCard extends StatelessWidget {
  const _ConceptCard({required this.concept});

  final RoadmapLessonConcept concept;

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
              concept.icon,
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
                  concept.titleKey.tr(),
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppSpacing.xs),
                Text(
                  concept.bodyKey.tr(),
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

class _ResourceList extends StatelessWidget {
  const _ResourceList({required this.lesson});

  final RoadmapLesson lesson;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var index = 0; index < lesson.resources.length; index++) ...[
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    lesson.resources[index].icon,
                    size: 18.sp,
                    color: context.colors.primary,
                  ),
                  SizedBox(width: AppSpacing.ms),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.resources[index].label,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          lesson.resources[index].descriptionKey.tr(),
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
            if (index != lesson.resources.length - 1) const AppDivider(),
          ],
        ],
      ),
    );
  }
}

class _CodeSnapshot extends StatelessWidget {
  const _CodeSnapshot({required this.lines});

  final List<String> lines;

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
        lines.join('\n'),
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onInverseSurface,
          fontFamily: 'monospace',
          height: 1.5,
        ),
      ),
    );
  }
}

class _StepList extends StatelessWidget {
  const _StepList({required this.lesson});

  final RoadmapLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < lesson.steps.length; index++)
          Padding(
            padding: EdgeInsets.only(
              bottom: index == lesson.steps.length - 1 ? 0 : AppSpacing.sm,
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
                          lesson.steps[index].label,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          lesson.steps[index].descriptionKey.tr(),
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

class _RuleList extends StatelessWidget {
  const _RuleList({required this.lesson});

  final RoadmapLesson lesson;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: context.colors.secondaryContainer.withValues(alpha: 0.45),
      child: Column(
        children: lesson.ruleKeys
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
  const _PracticeCard({required this.lesson});

  final RoadmapLesson lesson;

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
            lesson.practiceTitleKey.tr(),
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: AppSpacing.xs),
          Text(
            lesson.practiceSubtitleKey.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onPrimary.withValues(alpha: 0.82),
              height: 1.45,
            ),
          ),
          SizedBox(height: AppSpacing.md),
          for (final key in lesson.practiceKeys)
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
            label: 'lesson.back_button'.tr(),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                context.pop();
              } else {
                context.go(AppRoutes.roadmap);
              }
            },
            variant: ButtonVariant.secondary,
            isFullWidth: true,
            suffixIcon: Icon(IconsaxPlusLinear.arrow_left, size: 18.sp),
          ),
        ],
      ),
    );
  }
}
