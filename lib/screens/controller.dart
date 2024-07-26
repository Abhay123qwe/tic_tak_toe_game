import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxList<String> gameValue = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ].obs;
  RxBool isX = false.obs;
  RxBool isWinner = false.obs;
  RxInt click = 0.obs;

  void addValue(int index) {
    if (gameValue[index] == "") {
      if (isX.value) {
        gameValue[index] = "X";
        isX.value = !isX.value;
        click++;
      } else {
        gameValue[index] = "O";
        isX.value = !isX.value;
        click++;
      }
    } else {}
    checkWinner();

    if (isWinner.value = true) {
      matchDrwaMessage(click);
    }
  }

  void matchDrwaMessage(click) {
    if (click == 9) {
      Get.defaultDialog(
        title: "Match Draw",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        content: Column(
          children: [
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  gameValue.value = [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ];
                  click.value = 0;
                  Get.back();
                },
                child: const Text("Play Again",
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      );
    }
  }

  void checkWinner() {
    isWinner.value = true;
    //Horizontal
    if (gameValue[0] == gameValue[1] &&
        gameValue[0] == gameValue[2] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[3] == gameValue[4] &&
        gameValue[3] == gameValue[5] &&
        gameValue[3] != "") {
      winnerDialogBox();
    } else if (gameValue[6] == gameValue[7] &&
        gameValue[6] == gameValue[8] &&
        gameValue[6] != "") {
      winnerDialogBox();
    }
    //vertical

    else if (gameValue[0] == gameValue[3] &&
        gameValue[0] == gameValue[6] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      winnerDialogBox();
    } else if (gameValue[2] == gameValue[5] &&
        gameValue[2] == gameValue[8] &&
        gameValue[2] != "") {
      winnerDialogBox();
    }

    //Diagonal
    else if (gameValue[0] == gameValue[4] &&
        gameValue[0] == gameValue[8] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[2] == gameValue[4] &&
        gameValue[2] == gameValue[6] &&
        gameValue[2] != "") {
      winnerDialogBox();
    } else {}
  }

  void winnerDialogBox() {
    Get.defaultDialog(
        title: "🎖️ Winner 🎖️",
        content: Column(
          children: [
            const Icon(
              Icons.confirmation_num_rounded,
              size: 50,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            isX.value
                ? const Text(
                    "O is Winner",
                    style: TextStyle(fontSize: 30),
                  )
                : const Text(
                    "X is Winner",
                    style: TextStyle(fontSize: 30),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () {
                    isWinner.value = false;
                    gameValue.value = [
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                    ];
                    click.value = 0;

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.greenAccent,
                  ),
                  label: const Text(
                    "Play Again",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
