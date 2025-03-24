import 'package:flutter/widgets.dart';

class Insight {
  final String label;
  final double data;
  const Insight(
    this.label,
    this.data,
  );
}

class CategoryInsight {
  final Color color;
  final double min;
  final double max;
  final String label;

  const CategoryInsight(
    this.color,
    this.min,
    this.max,
    this.label,
  );
}
