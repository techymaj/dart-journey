import 'dart:io';

import 'dart:math';

enum Move {
  Rock,
  Paper,
  Scissors,
}

String played(String result) {
  return result.replaceAll("Move.", "");
}

void main() {
  final rng = Random();
  while (true) {
    stdout.write("Rock, Paper or Scissors? (r/p/s): ");
    final input = stdin.readLineSync();

    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      if (input == 'r') {
        playerMove = Move.Rock;
      } else if (input == 'p') {
        playerMove = Move.Paper;
      } else {
        playerMove = Move.Scissors;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print("You played: " + played(playerMove.toString()));
      print("AI played: " + played(aiMove.toString()));
      if (playerMove == aiMove) {
        print("It's a draw!");
      } else if (playerMove == Move.Rock && aiMove == Move.Scissors ||
          playerMove == Move.Paper && aiMove == Move.Rock ||
          playerMove == Move.Scissors && aiMove == Move.Paper) {
        print("You win!");
      } else {
        print("You lose!");
      }
    } else if (input == 'q') {
      print("Quiting...");
      break;
    } else {
      print("Invalid input.");
    }
  }
}
