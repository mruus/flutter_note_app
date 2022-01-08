import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: kWhite,
        image: DecorationImage(
          image: AssetImage('assets/Pattern Image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: child,
      ),
    );
  }
}

class LogoSvgIcon extends StatelessWidget {
  const LogoSvgIcon({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        'assets/logoSVG.svg',
        color: kColor_2,
      ),
    );
  }
}

class CardNote extends StatelessWidget {
  const CardNote({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kMargin),
      padding: const EdgeInsets.only(
        top: kMargin + 10,
        bottom: kMargin - 5,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kColor_1,
            width: .5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title != "" ? title : "Title Text",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: kColor_1,
                ),
                child: const Center(
                  child: Icon(
                    MdiIcons.pencil,
                    color: kWhite,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Container(
                width: 79,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: kColor_4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      MdiIcons.delete,
                      color: kWhite,
                      size: 15,
                    ),
                    Text(
                      "Delete".toUpperCase(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoggedUser extends StatelessWidget {
  const LoggedUser({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    var db = AuthQueries(FirebaseAuth.instance);
    return Container(
      margin: const EdgeInsets.only(
        top: kMargin + 10,
        left: kMargin,
        right: kMargin,
        bottom: kMargin * 2,
      ),
      child: Row(
        children: [
          const Icon(MdiIcons.accountSettingsOutline, color: kBlack),
          const SizedBox(width: 9),
          Text(firebaseUser!.email.toString()),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kMargin / 2,
              vertical: kMargin / 4,
            ),
            decoration: BoxDecoration(
              color: kColor_2,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(MdiIcons.accountArrowRight, color: kWhite, size: 20),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    db.signOut();
                  },
                  child: Text("LOGOUT",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                          fontSize: 12,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopBarAuth extends StatelessWidget {
  const TopBarAuth({
    Key? key,
    required this.text1,
    required this.text2,
    required this.detectTap,
  }) : super(key: key);
  final String text1, text2;
  final Function()? detectTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kMargin + 15),
      child: Row(
        children: [
          const LogoSvgIcon(width: 50, height: 50),
          const Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: text1,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: kColor_1,
                    ),
                  ),
                ),
                TextSpan(
                  text: text2,
                  recognizer: TapGestureRecognizer()
                    // ignore: avoid_print
                    ..onTap = detectTap,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      color: kColor_1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
