import 'package:flutter/material.dart';

class RoadmapItem {
  const RoadmapItem({
    required this.slug,
    required this.route,
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    required this.topicKeys,
  });

  final String slug;
  final String route;
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
  final List<String> topicKeys;
}
