findPopularityNowPlaying(double popularity) {
  final popularityData = (popularity / 2000) * 100;

  return popularityData.toStringAsFixed(2);
}

findPopularityTopRated(double popularity) {
  final popularityData = (popularity / 200) * 100;

  return popularityData.toStringAsFixed(2);
}
