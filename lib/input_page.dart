import "package:flutter/material.dart";
import "ReusableCard.dart";
import "Icon_Content.dart";
import "constants.dart";
import "result.dart";
import "calculate_bmi.dart";

enum Gender { non, male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.non;
  int height = 180;
  int weight = 80;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("BMI CALCULATOR"),
            backgroundColor: Color(0xff0A0E21)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reusable_card(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kactiveColor
                      : kinactiveColor,
                  cardChild:
                      IconContent(icon: Icons.favorite_outline, label: "MALE"),
                )),
                Expanded(
                  child: Reusable_card(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kactiveColor
                          : kinactiveColor,
                      cardChild:
                          IconContent(icon: Icons.favorite, label: "FEMALE")),
                )
              ],
            )),
            Expanded(
                child: Reusable_card(
                    onPress: () {},
                    colour: kactiveColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Height", style: kLabelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(height.toString(), style: kNumberTextStyle),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xff8d8e98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x15eb1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30)),
                            child: Slider(
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                            ),
                          ),
                        ]))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reusable_card(
                        onPress: () {},
                        colour: kactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: kLabelTextStyle,
                            ),
                            Text(weight.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    })
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: Reusable_card(
                        onPress: () {},
                        colour: kactiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: kLabelTextStyle,
                            ),
                            Text(age.toString(), style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    })
                              ],
                            )
                          ],
                        ))),
              ],
            )),
            GestureDetector(
              onTap: () {
                BMI calc = BMI(height: height, weight: weight);
                print(height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            bmi: calc.calculateBMI(),
                            result: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )),
                );
              },
              child: Container(
                child: Text("Calculate", style: TextStyle(fontSize: 20.0)),
                color: Colors.pink,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 60.0,
                alignment: Alignment.center,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
    );
  }
}
