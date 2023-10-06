import 'dart:io';
import 'dart:math';

Map<String, String> questions = {
  'What is the capital of France?': 'Paris',
  'What is 2 + 2?': '4',
  'What is capital of Pakistan?' : 'Islamabad',
  'Which type of programming language is used in Flutter app developement?' : 'Dart' ,
  'What is the capital of Spain?'  : 'Madrid' ,
  'What is 5 multiplied by 7?'  : '35' ,
  'What is the value of π (pi) approximately?'  : '13.4' ,
  'What is the chemical symbol for water?'  : 'H2O' ,
  'What is the process by which plants make their own food using sunlight?'  : 'Photosynthesis' ,
  'What is the largest planet in our solar system?'  : 'Jupiter' ,
  'What is the chemical symbol for gold?'  : 'Au' ,
  'What is the process by which water vapor turns into liquid water droplets in the atmosphere?'  : 'Condensation' ,
  'What is national flower of Pakistan?'  : 'Jasmine' ,
  'Which planet is known as the Red Planet?' : 'Mars' ,
  'Who wrote the play "Romeo and Juliet"?' : ' William Shakespeare' ,
  'How many sides does a triangle have?' :'3' ,
  'If you add 5 and 3, then subtract 2, what is the result?': '6' ,
  'What gas do plants absorb from the atmosphere and release oxygen during photosynthesis?': ' Carbon dioxide' ,
  'Which gas do humans breathe out?' : 'Carbondioxide' ,
  'What is the capital of Canada?' : 'Ottawa' ,
  'Which continent is known as the "Land Down Under"?' : 'Australia' ,
  'Who wrote the famous novel "To Kill a Mockingbir?' : 'Harper Lee' ,
  'Who is known as the "Father of the Nation" in Pakistan' : 'Quaid e Azam Muhammad Ali Jinnah' ,
  'In which year did Christopher Columbus first arrive in the Americas?' :'1492' ,
 'What is the result of 7 multiplied by 9?' : '63' ,
 'How many sides does a hexagon have?' : '6' ,
 'If you subtract 3 from 12, what is the result?' : '9' ,
 'What is the square root of 16?' : '4' ,
 'What is the chemical symbol for the element oxygen?' : 'O' ,
 'What is the freezing point of water in Fahrenheit?' : '32°F' ,
 'Who is known as the father of modern physics and developed the theOry of relativity?' : 'Albert Einstein' ,
 'Which U.S. President delivered the Gettysburg Address during the American Civil War?' : 'Abraham Lincoln' ,
 'Who was the first woman to fly solo across the Atlantic Ocean?' : 'Amelia Earhart' ,
 'In which year did World War II end?': '1945' ,
 'Who was the leader of the Indian independence movement against British rule?' : 'Mahatma Gandhi' ,
 'What ancient wonder was a colossal statue of the Greek god Zeus?' : 'Colossus of Rhodes' ,
 'Who wrote "The Catcher in the Rye"?' : 'J.D. Salinger' ,
 'What famous detective is known for his pipe and magnifying glass?' : 'Sherlock Holmes' ,
 'Who is the author of "Pride and Prejudice"?' : 'Jane Austen' ,
 'In J.K. Rowling Harry Potter series, what is the name of the school that Harry Potter attends?' : 'Hogwarts School of Witchcraft and Wizardry' ,
 'What is the longest river in the world?' : 'Nile River' ,
 'Who played the character of Jack Dawson in the movie "Titanic"?' : 'Leonardo DiCaprio' ,
 'What is the chemical symbol for the element hydrogen?' : 'H' ,
 'Who was the first President of the Pakistan?' : 'Iskandar Mirza' ,
 'Which country is known as the "Land of the Rising Sun"?' : 'Japan' ,
 'In which sport is the Ryder Cup contested?' : 'Golf' ,
};

class Quiz {
  List<String> randomQuestions;
  int score = 0;

  Quiz(this.randomQuestions);

  void startQuiz() {
    print('WELCOME TO THE QUIZ APP');
    for (var question in randomQuestions) {
      print('Question: $question');
      stdout.write('Your Answer: ');
      String userAnswer = stdin.readLineSync()!;
      checkAnswer(question, userAnswer);
    }
    showResult();
  }

  void checkAnswer(String question, String userAnswer) {
    String correctAnswer = questions[question]!;
    if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
      score++;
    }
  }

  void showResult() {
    double percentage = (score / randomQuestions.length) * 100;
    print('\nTotal correct answers: $score');
    print('Percentage: $percentage%');

    if (percentage > 50) {
      print('Congratulations!');
    }

    stdout.write('\nDo you want to continue the quiz? (yes/no): ');
    String continueQuiz = stdin.readLineSync()!;

    if (continueQuiz.toLowerCase() == 'yes') {
      print('\nStarting a new round of the quiz...\n');
      List<String> newRandomQuestions = getRandomQuestions(20); 
      Quiz quiz = Quiz(newRandomQuestions);
      quiz.startQuiz();
    } else {
      print('Quit');
    }
  }
}

void main() {
  List<String> randomQuestions = getRandomQuestions(30); 
  Quiz quiz = Quiz(randomQuestions);
  quiz.startQuiz();
}

List<String> getRandomQuestions(int numQuestions) {
  List<String> randomQuestions = [];
  List<String> allQuestions = questions.keys.toList();
  final random = Random();

  while (randomQuestions.length < numQuestions) {
    int index = random.nextInt(allQuestions.length);
    String question = allQuestions[index];
    if (!randomQuestions.contains(question)) {
      randomQuestions.add(question);
    }
  }

  return randomQuestions;
}