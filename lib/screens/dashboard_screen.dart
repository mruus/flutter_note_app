import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundImage(
          child: Column(
            children: [
              const LoggedUser(),

              // Card Note
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      CardNote(
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                      CardNote(
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                      CardNote(
                          title:
                              "How To Design A Modern Logo And Website Portofolio"),
                      CardNote(
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                      CardNote(
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                      CardNote(
                          title:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pushNamed(context, '/add_note')},
          backgroundColor: kColor_2,
          child: const Center(
            child: Icon(
              MdiIcons.plusThick,
              color: kWhite,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
