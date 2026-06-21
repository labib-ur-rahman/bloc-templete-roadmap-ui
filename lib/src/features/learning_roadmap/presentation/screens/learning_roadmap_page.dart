import 'package:bloc_template_roadmap_ui/src/imports/imports.dart';

import '../../domain/entities/roadmap_item.dart';

class LearningRoadmapPage extends StatelessWidget {
  const LearningRoadmapPage({super.key});

  static const List<RoadmapItem> _items = [
    RoadmapItem(
      slug: 'project-foundations',
      route: AppRoutes.projectFoundations,
      titleKey: 'roadmap.items.foundations.title',
      descriptionKey: 'roadmap.items.foundations.description',
      icon: IconsaxPlusLinear.map_1,
      topicKeys: [
        'roadmap.topics.project_map',
        'roadmap.topics.pubspec',
        'roadmap.topics.conventions',
      ],
    ),
    RoadmapItem(
      slug: 'app-startup',
      route: AppRoutes.appStartup,
      titleKey: 'roadmap.items.startup.title',
      descriptionKey: 'roadmap.items.startup.description',
      icon: IconsaxPlusLinear.play_circle,
      topicKeys: [
        'roadmap.topics.main',
        'roadmap.topics.wrappers',
        'roadmap.topics.config',
      ],
    ),
    RoadmapItem(
      slug: 'design-system',
      route: AppRoutes.designSystem,
      titleKey: 'roadmap.items.design.title',
      descriptionKey: 'roadmap.items.design.description',
      icon: IconsaxPlusLinear.colorfilter,
      topicKeys: [
        'roadmap.topics.theme',
        'roadmap.topics.tokens',
        'roadmap.topics.responsive',
      ],
    ),
    RoadmapItem(
      slug: 'feature-first-architecture',
      route: AppRoutes.featureArchitecture,
      titleKey: 'roadmap.items.architecture.title',
      descriptionKey: 'roadmap.items.architecture.description',
      icon: IconsaxPlusLinear.hierarchy_3,
      topicKeys: [
        'roadmap.topics.layers',
        'roadmap.topics.boundaries',
        'roadmap.topics.imports',
      ],
    ),
    RoadmapItem(
      slug: 'bloc-state-management',
      route: AppRoutes.blocStateManagement,
      titleKey: 'roadmap.items.bloc.title',
      descriptionKey: 'roadmap.items.bloc.description',
      icon: IconsaxPlusLinear.data_2,
      topicKeys: [
        'roadmap.topics.events',
        'roadmap.topics.states',
        'roadmap.topics.side_effects',
      ],
    ),
    RoadmapItem(
      slug: 'routing-and-navigation',
      route: AppRoutes.routingNavigation,
      titleKey: 'roadmap.items.routing.title',
      descriptionKey: 'roadmap.items.routing.description',
      icon: IconsaxPlusLinear.routing_2,
      topicKeys: [
        'roadmap.topics.go_router',
        'roadmap.topics.guards',
        'roadmap.topics.deep_links',
      ],
    ),
    RoadmapItem(
      slug: 'data-services-and-errors',
      route: AppRoutes.servicesFailures,
      titleKey: 'roadmap.items.data.title',
      descriptionKey: 'roadmap.items.data.description',
      icon: IconsaxPlusLinear.cloud_connection,
      topicKeys: [
        'roadmap.topics.dio',
        'roadmap.topics.repositories',
        'roadmap.topics.failures',
      ],
    ),
    RoadmapItem(
      slug: 'production-workflow',
      route: AppRoutes.productionWorkflow,
      titleKey: 'roadmap.items.production.title',
      descriptionKey: 'roadmap.items.production.description',
      icon: IconsaxPlusLinear.verify,
      topicKeys: [
        'roadmap.topics.testing',
        'roadmap.topics.localization',
        'roadmap.topics.quality',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _RoadmapHero(moduleCount: _items.length)),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.pagePadding,
              AppSpacing.lg,
              AppSpacing.pagePadding,
              AppSpacing.xxxl,
            ),
            sliver: SliverList.separated(
              itemCount: _items.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppSpacing.ms),
              itemBuilder: (context, index) => _RoadmapTile(
                item: _items[index],
                index: index,
                isLast: index == _items.length - 1,
                onTap: () => context.push(_items[index].route),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoadmapHero extends StatelessWidget {
  const _RoadmapHero({required this.moduleCount});

  final int moduleCount;

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
        borderRadius: BorderRadius.vertical(bottom: AppBorders.xl.bottomLeft),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.ms,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: colors.surface.withValues(alpha: 0.72),
                  borderRadius: AppBorders.full,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(IconsaxPlusLinear.code_1, size: 16.sp),
                    SizedBox(width: AppSpacing.sm),
                    Text(
                      'roadmap.eyebrow'.tr(),
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.xl),
              Text(
                'roadmap.title'.tr(),
                style: context.textTheme.displaySmall?.copyWith(
                  color: colors.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                  height: 1.08,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'roadmap.subtitle'.tr(),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: colors.onPrimaryContainer.withValues(alpha: 0.78),
                  height: 1.5,
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  _HeroMetric(
                    value: '$moduleCount',
                    label: 'roadmap.modules'.tr(),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  _HeroMetric(
                    value: 'roadmap.beginner'.tr(),
                    label: 'roadmap.level'.tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: context.colors.surface.withValues(alpha: 0.68),
          borderRadius: AppBorders.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoadmapTile extends StatelessWidget {
  const _RoadmapTile({
    required this.item,
    required this.index,
    required this.isLast,
    required this.onTap,
  });

  final RoadmapItem item;
  final int index;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 44.w,
            child: Column(
              children: [
                Container(
                  width: 36.r,
                  height: 36.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? colors.primary
                        : colors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.outlineVariant),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: index == 0
                          ? colors.onPrimary
                          : colors.onSurfaceVariant,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: colors.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.sm),
              child: AppCard(
                onTap: onTap,
                color: index == 0
                    ? colors.primaryContainer.withValues(alpha: 0.42)
                    : colors.surfaceContainerLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: colors.secondaryContainer,
                            borderRadius: AppBorders.sm,
                          ),
                          child: Icon(
                            item.icon,
                            size: 20.sp,
                            color: colors.onSecondaryContainer,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          IconsaxPlusLinear.arrow_right_3,
                          size: 18.sp,
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      item.titleKey.tr(),
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      item.descriptionKey.tr(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: item.topicKeys
                          .map(
                            (key) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: colors.surfaceContainerHighest,
                                borderRadius: AppBorders.full,
                              ),
                              child: Text(
                                key.tr(),
                                style: context.textTheme.labelMedium,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
