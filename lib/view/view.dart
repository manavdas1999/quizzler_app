import 'package:flutter/material.dart';

import 'widgets.dart';
import '../model/model.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  Model data = Model();
  List<ResponseIcons> iconList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade800,
        centerTitle: true,
        title:
            Text("${data.getCurrentQuestionNo()}/${data.getTotalQuestionNo()}"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  onReset();
                });
              },
              icon: const Icon(Icons.refresh, size: 35)),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Expanded(
            child: Center(
              child: Text(
                data.getCurrentQuestionText(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ActionButton(
                buttonType: "true",
                action: () => {onClickButton(true)},
              ),
              ActionButton(
                buttonType: "false",
                action: () => {onClickButton(false)},
              ),
            ],
          ),
          Container(
            height: 0,
            margin: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: iconList,
            ),
          ),
        ]),
      ),
    );
  }

  void onClickButton(bool userResponse) {
    setState(() {
      if (data.isEndReached() == false) {
        if (userResponse == data.getCurrentQuestionAns()) {
          iconList.add(const ResponseIcons(response: "correct"));
        } else {
          iconList.add(const ResponseIcons(response: "wrong"));
        }
      } else {
        showAlertDialog(context);
      }
      data.nextQuestion();
    });
  }

  void onReset() {
    data.resetQuestionBank();
    iconList.clear();
  }

  void showAlertDialog(BuildContext context) {
    //creating alertDialog widget
    var alertDialog = AlertDialog(
      title: const Text("Quiz Finished!"),
      content: const Text("Click on restart to play again."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, "OK");
          },
          child: const Text(
            "OK",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, "Restart");
            setState(() {
              onReset();
            });
          },
          child: Text(
            "Restart",
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange.shade800,
            ),
          ),
        )
      ],
    );

    //to popup alertDialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
