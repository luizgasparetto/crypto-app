class CryptocoinEntity {
  final int id;
  final String name;
  final String abbreviation;
  final String image;
  final double lastPrice;
  final double currentPrice;

  const CryptocoinEntity({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.image,
    required this.lastPrice,
    required this.currentPrice,
  });
}
