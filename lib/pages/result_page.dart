import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quiz_page.dart';

class ResultPage extends StatelessWidget {
  final int result;

  const ResultPage(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.home,
            size: 30,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
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
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Nice Work",
                  style: GoogleFonts.montserrat(
                    color: Color(0xffFFFFFF),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF9051),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFFFFFF),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .4),
                        offset: const Offset(0, 5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: const Color(0xffFF9051),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffFFFFFF),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .4),
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/check.png",
                          height: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/star.png",
                      height: 35,
                      color: result >= 2 ? null : const Color(0xff7646FE),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/star.png",
                      height: 60,
                      color: result >= 5 ? null : const Color(0xff7646FE),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/star.png",
                      height: 35,
                      color: result >= 8 ? null : const Color(0xff7646FE),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "You got ${result * 10}%",
                  style: GoogleFonts.quicksand(
                    color: Color(0xffFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF9051),
                      fixedSize: const Size.fromHeight(60),
                      shadowColor: Colors.black.withValues(alpha: .5),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
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
                        "Play Again",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffAA8DFF),
                      fixedSize: const Size.fromHeight(60),
                      shadowColor: Colors.black.withValues(alpha: .5),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Home Page",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
