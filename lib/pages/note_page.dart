import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:note_app/componets/drawer.dart';
import 'package:note_app/componets/notetile.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/note.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
//text controller to acess what the user typed
  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
// on app startup, fetch existing notes
    readNotes();
  }

// Create a note
  void createnote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              content: TextField(controller: textcontroller),
              actions: [
//create button
                MaterialButton(
                  onPressed: () {
                    // add to the database
                    context.read<NoteDatabse>().addNote(textcontroller.text);

// clear the controller
                    textcontroller.clear();

                    // pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                )
              ],
            ));
  }

// Read a note
  void readNotes() {
    context.read<NoteDatabse>().fetchNotes();
  }

//update a note
  void updatenote(Note note) {
// pre-fill the current note text
    textcontroller.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text('Update Note'),
              content: TextField(
                controller: textcontroller,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
// update in db
                    context
                        .read<NoteDatabse>()
                        .updateNote(note.id, textcontroller.text);
                    // clear controller
                    textcontroller.clear();
                    //pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                )
              ],
            ));
  }

// delete a note
  void deleteNote(int id) {
    context.read<NoteDatabse>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
//note database
    final noteDatabase = context.watch<NoteDatabse>();

    //current note
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "Notes",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        // ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createnote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Colors.green.shade400,
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// Heading
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // List of Notes
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  // get individal note
                  final note = currentNotes[index];
                  // list tile UI
                  return NoteTile(
                    text: note.text,
                    onEditPressed: () => updatenote(note),
                    onDeletePressed: () => deleteNote(note.id),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
