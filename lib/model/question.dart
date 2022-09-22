

class Question {
  final String questionText;
  final bool answer;

  Question({required this.questionText, required this.answer});


  String getQuestionText(){
    return questionText;
  }

  bool getAnswer(){
    return answer;
  }
}

