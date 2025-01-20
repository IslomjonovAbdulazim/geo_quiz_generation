import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/question_model.dart';
import 'result_page.dart';

class GeoQuizPage extends StatefulWidget {
  const GeoQuizPage({super.key});

  @override
  State<GeoQuizPage> createState() => _GeoQuizPageState();
}

class _GeoQuizPageState extends State<GeoQuizPage> {
  List<QuestionModel> questions = [];
  int currentQuestion = 0;
  String? selected;
  int correctResponses = 0;

  @override
  void initState() {
    questions = generateQuestions();
    super.initState();
  }

  void selectVariant(String variant, String correct) {
    selected = variant;
    if (selected == correct) {
      correctResponses++;
    }
    setState(() {});
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestion < questions.length - 1) {
      currentQuestion++;
      selected = null;
      setState(() {});
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return ResultPage(correctResponses);
          },
        ),
      );
    }
  }

  Widget variantWidget(String variant) {
    QuestionModel current = questions[currentQuestion];
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: selected != null
            ? null
            : () {
                selectVariant(variant, current.correct);
              },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selected != null && variant == current.correct
                ? Color(0xffFF9051)
                : Color(0xffFFFFFF).withValues(alpha: .4),
          ),
          child: Center(
            child: Text(
              variant,
              style: GoogleFonts.montserrat(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    QuestionModel current = questions[currentQuestion];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff9F7FFF),
              Color(0xff8055FE),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: (currentQuestion + 1) / 10,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFF9051),
                    backgroundColor: const Color(0xff7646FE),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Guess the Country by Its Flag!",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFFFFF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.network(
                        "https://countryflagsapi.netlify.app/flag/${current.country}.svg",
                        width: MediaQuery.of(context).size.width * .9,
                        errorBuilder: (_, __, ___) {
                          return Text(
                            "Flag Not Found",
                            style: GoogleFonts.montserrat(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      variantWidget(current.variants[0]),
                      SizedBox(width: 5),
                      variantWidget(current.variants[1]),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      variantWidget(current.variants[2]),
                      SizedBox(width: 5),
                      variantWidget(current.variants[3]),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFF9051),
                      fixedSize: Size.fromHeight(55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: selected == null
                        ? null
                        : () {
                            nextQuestion(context);
                          },
                    child: Center(
                      child: Text(
                        selected != null ? "Next" : "Select",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
