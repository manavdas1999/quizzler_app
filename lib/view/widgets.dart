import 'package:flutter/material.dart';


// response icons for listView
class ResponseIcons extends StatelessWidget {
  final String response;
  const ResponseIcons({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return response == "correct" ? const Icon(Icons.check, color: Colors.green, size: 28) : const Icon(Icons.clear, color: Colors.red, size: 28,);
  }
}


//  actions buttons
class ActionButton extends StatelessWidget {
  final String buttonType;
  final VoidCallback action;

  const ActionButton({
    Key? key,
    required this.buttonType,
    required this.action,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonType == "true" ? Colors.green.shade700 : Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: action,
        child: Text(
          buttonType == "true" ? "True": "False",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
