import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/models/note_queries.dart';
import 'package:flutter_note_app/models/notes.dart';
import 'package:flutter_note_app/note_list.dart';
import 'package:flutter_note_app/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<List<Note>>(
          create: (_) => NoteStore().getNotes,
          initialData: const [],
      child: SafeArea(
        child: Scaffold(
          body: BackgroundImage(
            child: Column(
              children: const [
                LoggedUser(),
    
                // Card Note
                Expanded(
                  child: SingleChildScrollView(
                    child: NoteList(),
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
      ),
    );
  }
}
