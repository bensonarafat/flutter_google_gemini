enum SafetyThreshold {
  // Threshold is unspecified.
  unspecified,
  // Content with NEGLIGIBLE will be allowed.
  lowAndAbove,
  // Content with NEGLIGIBLE and LOW will be allowed.
  mediumAndAbove,
  // 	Content with NEGLIGIBLE, LOW, and MEDIUM will be allowed.
  onlyHigh,
  // All content will be allowed.
  none,
}
