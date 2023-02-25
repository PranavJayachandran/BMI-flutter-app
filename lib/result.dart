import "package:flutter/material.dart";

class Result extends StatelessWidget {
  const Result(
      {required this.bmi, required this.result, required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("YOUR RESULT"),
            backgroundColor: Color(0xff0A0E21)),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xff1D1E33),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(result,
                        style: TextStyle(color: Colors.green, fontSize: 20.0)),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Text("You have a normal body weight. Good Job!")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text("Re-Calculate", style: TextStyle(fontSize: 20.0)),
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
