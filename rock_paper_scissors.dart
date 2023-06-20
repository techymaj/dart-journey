import 'dart:io';
import 'dart:math';

enum Choices {
  Rock,
  Paper,
  Scissors,
}

main() {
  String? playerInput = '';
  while (playerInput != 'q') {
    // set the stage
    int ai = Random().nextInt(3);
    var aiChoice = Choices.values[ai].name;

    void rps() {
      if (playerInput == 'r') {
        playerInput = 'Rock';
      }
      if (playerInput == 'p') {
        playerInput = 'Paper';
      }
      if (playerInput == 's') {
        playerInput = 'Scissors';
      }
    }

    void draw() {
      rps();
      print('You chose $playerInput');
      print('AI chose $aiChoice');
      print('It\'s a draw!');
    }

    void lose() {
      rps();
      print('You chose $playerInput');
      print('AI chose $aiChoice');
      print('You lose!');
    }

    void win() {
      rps();
      print('You chose $playerInput');
      print('AI chose $aiChoice');
      print('You win!');
    }

    print('Rock, Paper, Scissors! (What\'s your choice?) r/p/s: ');
    playerInput = stdin.readLineSync();

    switch (playerInput) {
      case 'r' when aiChoice == 'Rock':
        draw();
        break;
      case 'r' when aiChoice == 'Paper':
        lose();
        break;
      case 'r' when aiChoice == 'Scissors':
        win();
        break;
      case 'p' when aiChoice == 'Paper':
        draw();
        break;
      case 'p' when aiChoice == 'Scissors':
        lose();
        break;
      case 'p' when aiChoice == 'Rock':
        win();
        break;
      case 's' when aiChoice == 'Scissors':
        draw();
        break;
      case 's' when aiChoice == 'Rock':
        lose();
        break;
      case 's' when aiChoice == 'Paper':
        win();
        break;
      case 'q':
        print('Goodbye!');
        break;
      default:
        print('Invalid choice!');
    }
  }
}
