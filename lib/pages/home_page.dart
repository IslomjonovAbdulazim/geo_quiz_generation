import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quiz_page.dart';

class GeoQuizHomePage extends StatelessWidget {
  const GeoQuizHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/question_mark.png",
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 60,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Challenge Your Flag Knowledge",
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        color: Color(0xff280A82),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Sharpen your geographical skills with this fun flag quiz.",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Color(0xffA7A7A7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF9051),
                        fixedSize: const Size.fromHeight(55),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return const GeoQuizPage();
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Start Quiz",
                          style: GoogleFonts.montserrat(
                            color: Color(0xffFFFFFF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
