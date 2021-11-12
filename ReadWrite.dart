import 'dart:io';

Future<void> main() async{
    stdout.write('Introduzca el nombre del archivo: ');
    var textName = stdin.readLineSync();
    stdout.write('Introduzca el texto del archivo: ');
    var text = stdin.readLineSync();

    var myFile = File(textName.toString());
    await WriteOnFile(myFile, text.toString());

    stdout.write('Desea imprimir el contenido del archivo? (Y): ');
    if(stdin.readLineSync().toString().toUpperCase() == 'Y')
    {
      await ReadFile(myFile).then((readText) => print(readText));
    }
}
Future<void> WriteOnFile(File stream, String text) async{
    stream.writeAsString(text);
}
Future<String> ReadFile(File stream) async{
    var readText = await stream.readAsString();
    return readText.toString();
}