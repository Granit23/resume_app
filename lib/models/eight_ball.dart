import 'dart:math';

class EightBall {
  final List<String> phrases;
  final Random random = Random();
  int _currentIndex = 0;

  static const defaultPhrases = ["We're no strangers to love", "Never gonna give you up", "Never gonna let you down", "Never gonna run around and desert you", 
    "Never gonna make you cry", "Never gonna say goodbye", "Never gonna tell a lie and hurt you"];

  EightBall({this.phrases = defaultPhrases});


  String getAnswer() {
    return phrases[_currentIndex];
  }

  void randomizeAnswer() {
    _currentIndex = random.nextInt(7);
  }

}