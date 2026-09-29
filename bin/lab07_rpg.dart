
import 'dart:io';

import 'package:lab07_rpg/battle.dart';
import 'package:lab07_rpg/character.dart';
import 'package:lab07_rpg/characters.dart';

void printClasses() {
  print('');
  print('');
  print('1 - ${Warrior(name: 'preview')}');
  print('2 - ${Mage(name: 'preview')}');
  print('3 - ${Archer(name: 'preview')}');

}


Character selectCharacter(String prompt){
  stdout.write('$prompt - введите имя персонажа: ');
  String? name = stdin.readLineSync();
  name = (name == null || name.trim().isEmpty)
  ? 'герой'
  :name.trim();
  
  printClasses();

  while(true){
    stdout.write('выберите класс (1/2/3): ');
    String? choice = stdin.readLineSync();
    switch(choice?.trim()){
      case '1': return Warrior(name : name);
      case '2': return Mage(name : name);
      case '3': return Archer(name : name);
      default: print('Неверный выбор. Введите 1 ,2 или 3.');
    }
  }
}
void main(){
  print('RPG Битва');
  Character player = selectCharacter('Игрок');
  Character enemy = selectCharacter('Противник');
  
  battle(player,enemy);

  stdout.write('Сыграть еще раз(да/нет):');
  String? again = stdin.readLineSync();

  if (again?.trim().toLowerCase() == 'да'){main();}
  else{print('Спасибо за игру');}
}