enum ProjectRadius {
  /// Small radius [8.0]
  small(8),

  /// Normal radius [16.0]
  medium(16),

  /// Large radius [32.0]
  large(32);

  final double value;
  const ProjectRadius(this.value);
}
