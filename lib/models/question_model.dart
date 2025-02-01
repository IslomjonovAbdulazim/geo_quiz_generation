import 'dart:math';

import 'country_model.dart';


class QuestionModel {
  late String country;
  late List<String> variants;
  late String correct;

  QuestionModel({
    required this.country,
    required this.variants,
    required this.correct,
  });
}

List<QuestionModel> generateQuestions() {
  List<QuestionModel> questions = [];
  Random random = Random();

  for (int i = 0; i < 10; i++) {
    int randomNumber = random.nextInt(countries.length);

    CountryModel correctCountry = countries[randomNumber];

    Set<String> variants = {correctCountry.name};
    while (variants.length < 4) {
      int rNumber = random.nextInt(countries.length);
      String rCountry = countries[rNumber].name;
      variants.add(rCountry);
    }

    List<String> shuffledVariants = variants.toList();
    shuffledVariants.shuffle();

    questions.add(
      QuestionModel(
        country: correctCountry.code,
        variants: shuffledVariants,
        correct: correctCountry.name,
      ),
    );
  }

  return questions;
}
