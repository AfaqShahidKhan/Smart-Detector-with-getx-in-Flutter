import 'package:flutter/material.dart';
import 'package:smart_detector_getx/Buttons/un_tap_button.dart';
import 'package:smart_detector_getx/Buttons/tap_button.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  var iconStraight = Icons.keyboard_arrow_up;
  var iconLeft = Icons.keyboard_arrow_left;
  var iconRight = Icons.keyboard_arrow_right;
  var iconBack = Icons.keyboard_arrow_down;
  var iconStart = Icons.play_arrow;
  var iconPause = Icons.pause;

// Bool
  Rxn<bool> isStart = Rxn<bool>(false);
  Rxn<bool> buttonStart = Rxn<bool>(false);
  Rxn<bool> buttonStraight = Rxn<bool>(false);
  Rxn<bool> buttonLeft = Rxn<bool>(false);
  Rxn<bool> buttonRight = Rxn<bool>(false);
  Rxn<bool> buttonBack = Rxn<bool>(false);
  // Rxn<Function> pressStart = Rxn<Function>();
  // Functions

  pressStart() {
    isStart.value = false;
    buttonStart.value = false;
    buttonStraight.value = false;
    buttonLeft.value = false;
    buttonRight.value = false;
    buttonBack.value = false;
  }

  void pressStop() {
    isStart.value = true;
    buttonStart.value = true;
    buttonStraight.value = false;
    buttonLeft.value = false;
    buttonRight.value = false;
    buttonBack.value = false;
  }

  void pressStright() {
    buttonStraight.value = true;
    buttonLeft.value = false;
    buttonRight.value = false;
    buttonBack.value = false;
  }

  void pressLeft() {
    buttonStraight.value = false;
    buttonLeft.value = true;
    buttonRight.value = false;
    buttonBack.value = false;
  }

  void pressRight() {
    buttonStraight.value = false;
    buttonLeft.value = false;
    buttonRight.value = true;
    buttonBack.value = false;
  }

  void pressBack() {
    buttonStraight.value = false;
    buttonLeft.value = false;
    buttonRight.value = false;
    buttonBack.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202226),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xff202226),
        elevation: 0.0,
        child: Text(
          '                Developed under the instructions of: \n \n                            instagram.com/DholaSain\n\n',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Center(
        child: Obx(
          () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isStart.value!
                    ? GestureDetector(
                        onTap: pressStright,
                        child: buttonStraight.value!
                            ? TapButton(
                                icon: iconStraight,
                              )
                            : UntapButton(
                                icon: iconStraight,
                              ),
                      )
                    : UntapButton(
                        icon: iconStraight,
                      ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isStart.value!
                        ? GestureDetector(
                            // Left BUTTON
                            onTap: pressLeft,
                            child: buttonLeft.value!
                                ? TapButton(
                                    icon: iconLeft,
                                  )
                                : UntapButton(
                                    icon: iconLeft,
                                  ),
                          )
                        : UntapButton(
                            icon: iconLeft,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    isStart.value!
                        ? GestureDetector(
                            onTap: pressStart,
                            child: PowerButton(
                              icon: iconPause,
                            ),
                          )
                        : GestureDetector(
                            onTap: pressStop,
                            child: OffPowerButton(
                              icon: iconStart,
                            ),
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    isStart.value!
                        ? GestureDetector(
                            // Right BUTTON
                            onTap: pressRight,
                            child: buttonRight.value!
                                ? TapButton(
                                    icon: iconRight,
                                  )
                                : UntapButton(
                                    icon: iconRight,
                                  ),
                          )
                        : UntapButton(
                            icon: iconRight,
                          ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                isStart.value!
                    ? GestureDetector(
                        onTap: pressBack,
                        child: buttonBack.value!
                            ? TapButton(
                                icon: iconBack,
                              )
                            : UntapButton(
                                icon: iconBack,
                              ),
                      )
                    : UntapButton(
                        icon: iconBack,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
