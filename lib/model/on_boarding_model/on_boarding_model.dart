class OnBoarding {
  final String image;
  final String text;
  final String? subText;
  final String textAnotherColor;
  final String textFirstColor;

  const OnBoarding(
      {required this.image,
      required this.text,
      this.subText,
      required this.textAnotherColor,
      required this.textFirstColor});
}

List<OnBoarding> itemOnBoarding = [
  const OnBoarding(
      image: ('assets/images/on_boarding_1.svg'),
      text: ('Welcome to '),
      textAnotherColor: 'Star Store ',
      textFirstColor: 'your cosmic shopping destination!'),
  const OnBoarding(
    image: ('assets/images/on_boarding_2.svg'),
    text: ('Discover the magic of '),
    textAnotherColor: 'Star Store',
    textFirstColor: ', where innovation and imagination collide.',
    subText: (''),
  ),
  const OnBoarding(
    image: ('assets/images/on_boarding_3.svg'),
    text: ('Get to know '),
    textAnotherColor: 'Star Store ',
    textFirstColor:
        'where every purchase feels like a journey through space and time.',
    subText: (''),
  ),
];
