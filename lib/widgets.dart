import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    Key? key, required this.title,
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
                  color: kColor_2,
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
    return Container(
      margin: const EdgeInsets.only(
        top: kMargin + 10,
        left: kMargin,
        right: kMargin,
        bottom: kMargin * 2,
      ),
      child: Row(
        children: const [
          Icon(MdiIcons.accountSettingsOutline, color: kBlack),
          SizedBox(width: 9),
          Text("kingzubeir10@gmail.com"),
        ],
      ),
    );
  }
}