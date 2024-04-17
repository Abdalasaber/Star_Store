class BannerModel {
  final String image;
  final String text;

  const BannerModel({
    required this.image,
    required this.text,
  });
}

List<BannerModel> itemBannerModel = [
  const BannerModel(
    image: ('assets/images/on_boarding_1.svg'),
    text: ('Discover'),
  ),
  const BannerModel(
    image: ('assets/images/on_boarding_2.svg'),
    text: ('Shop'),
  ),
  const BannerModel(
    image: ('assets/images/on_boarding_3.svg'),
    text: ('Buy'),
  ),
];
