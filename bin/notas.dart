import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  print("Digite o comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");
  List<String> comandos = <String>["1", "2", "3"];
  String? entrada = "";
  entrada = stdin.readLineSync();
  if (entrada == null || !comandos.contains(entrada)) {
    print("Comando Invalido! Tente novamente");
    getComando();
  }
  return entrada!;
}

List<String> adicionaNota(List<String> notas) {
  //essa função retorna a lista de notas por isso comença com List<String>
  print("Digite a sua nota");
  String? nota = "";
  nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty) {
    print("Nota vazia não é permitido, tente novamente");
    adicionaNota(notas);
  }
  notas.add(nota!);
  return notas;
}

void listarNotas(List<String> notas) {
  //essa função não retorna a lista de notas por isso comença com void
  for (var i = 0; i < notas.length; i++) {
    print("Nota ${i + 1}: ${notas[i]}");
  }
}

void menu(List<String> notas) {
  print("");
  cabecalho();
  print("");
  String comando = getComando();
  print("");

  switch (comando) {
    case "1":
      adicionaNota(notas);
      menu(notas);

    case "2":
      listarNotas(notas);
      menu(notas);

    case "3":
      print("Até uma próxima vez!");
  }
}

void cabecalho(){
print ("  _    _       _            ");
print (" | \\ | |     | |           ");
print (" |  \\| | ___ | |_ __ _ ___ ");
print (" | . \` |/ _ \\| __/ _\` / __|");
print (" | |\\  | (_) | || (_| \\__ \\");
print (" |_| \\_|\\___/ \\__\\__,_|___/");
print ("                           ");
print ("                           ");
}