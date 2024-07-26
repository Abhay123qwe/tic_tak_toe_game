import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tak_toe_game/screens/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.isX.value
                          ? const Text(
                              "X Turn",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            )
                          : const Text(
                              "O Turn",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                          color: controller.isX.value == false
                              ? Colors.blue
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "O",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                            color: controller.isX.value == false
                                ? Colors.grey[800]
                                : Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "X",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        controller.addValue(index);
                      },
                      child: Obx(
                        () => Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                controller.gameValue[index],
                                style: const TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            )),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
