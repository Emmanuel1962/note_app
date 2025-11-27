import 'package:isar/isar.dart';
// this line is needed to generate file
//then run: dart run build_runner build--- we are runing this to save our document in the isar page
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
