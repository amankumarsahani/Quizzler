import 'question_bank.dart';

class QuizBrain {
  int _quesNum = 0;

  final List<QuestionBank> _questionBank = [
    QuestionBank('The smallest country in the world is Monaco', false),
    QuestionBank('A heptagon has six sides.', false),
    QuestionBank(
        'Lightning is seen before it\'s heard because light travels faster than sound.',
        true),
    QuestionBank(
        'U.S. presidents originally lived in the "President\'s Palace," but the name was changed to avoid affectations of royalty.',
        true),
    QuestionBank(
        'The biggest muscle in the human body is the gluteus maximus (buttock muscle).',
        true),
    QuestionBank(
        'The Titanic had enough lifeboats to save almost everyone on board.',
        false),
    QuestionBank(
        'Bollywood is the nickname of Britain\'s movie industry.', false),
    QuestionBank('Only Americans and Soviets have walked on the Moon.', false),
    QuestionBank('Vampire bats feed on blood.', true),
    QuestionBank(
        'When Mickey Mouse debuted on screen in 1928, it was in a silent film.',
        false),
  ];

  bool isFinished() {
    return _quesNum >= _questionBank.length - 1 ? true : false;
  }

  void nextQues() {
    if (_quesNum < _questionBank.length - 1) {
      _quesNum++;
    }
  }

  void reset() {
    _quesNum = 0;
  }

  String quesText() {
    return _questionBank[_quesNum].ques;
  }

  bool quesAns() {
    return _questionBank[_quesNum].ans;
  }
}
