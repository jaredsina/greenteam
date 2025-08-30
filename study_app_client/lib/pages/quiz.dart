import 'package:flutter/material.dart';
import 'quiz_create.dart';

class QuizArguments {
  final String selectedDifficulty;
  final String selectedLength;
  final String selectedType;
  final String topic;

  QuizArguments(
    this.selectedDifficulty,
    this.selectedLength,
    this.topic,
    this.selectedType,
  );
}

class QuestionTrueFalse {
  final String question;
  final bool answer;

  QuestionTrueFalse(this.question, this.answer);
}

class QuestionMatching {
  final List<Map<String, String>> pairs;

  QuestionMatching(this.pairs);
}

class QuestionWrittenResponse {
  final String question;

  QuestionWrittenResponse(this.question);
}

class QuestionMultipleChoice {
  final String question;
  final List<MultipleChoiceOption> options;

  QuestionMultipleChoice(this.question, this.options);
}

class MultipleChoiceOption {
  final String value;
  final bool isCorrect;

  MultipleChoiceOption(this.value, this.isCorrect);
}

class Quiz extends StatefulWidget {
  final dynamic topic;

  const Quiz({super.key, this.topic});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.all(10),
    fixedSize: Size(200, 100),
  );
  final EdgeInsets padding = const EdgeInsets.all(10);
  int currentQuestion = 0;

  List<Widget> getQuizType(QuizArguments arguments) {
    String quizType = arguments.selectedType;

    if (quizType == "True/False") {
      return makeTF(arguments);
    } else if (quizType == "Matching") {
      return makeMatch(arguments);
    } else if (quizType == "Written Response") {
      return makeWR(arguments);
    } else if (quizType == "Multiple Choice") {
      return makeMultipleChoice(arguments);
    } else {
      throw Error();
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuizArguments data =
        ModalRoute.of(context)?.settings.arguments as QuizArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.topic?.toString() ?? 'Quiz'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getQuizType(data),
        ),
      ),
    );
  }

  List<Widget> makeMultipleChoice(QuizArguments data) {
    return <Widget>[
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text(
            'A) Troodon had one of the smallest brain-to-body ratios among non-avian dinosaurs, indicating it relied mainly on instinct rather than learned behavior.',
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text(
            'B) Fossilized nests attributed to Troodon suggest it laid a single egg per clutch, similar to most modern reptiles.',
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text(
            'C) Troodon possessed serrated teeth and stereoscopic vision, indicating it was likely an omnivore or a predator with complex hunting strategies.',
          ),
        ),
      ),
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text(
            'D) The Troodon genus is now considered entirely invalid, with all fossils reclassified under the genus Velociraptor after DNA analysis.',
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/study/quiz2');
        },
        child: const Text('Next'),
      ),
    ];
  }

  List<Widget> makeTF(QuizArguments data) {
    List<QuestionTrueFalse> questions = [
      QuestionTrueFalse('The capital of Australia is Sydney.', false),
      QuestionTrueFalse('Humans have more than five senses.', true),
      QuestionTrueFalse('Water boils at 100°C at sea level.', true),
      QuestionTrueFalse('Bats are blind.', false),
      QuestionTrueFalse(
        'The Great Wall of China is visible from space with the naked eye.',
        false,
      ),
      QuestionTrueFalse('The capital of Australia is Sydney.', false),
      QuestionTrueFalse('Humans have more than five senses.', true),
      QuestionTrueFalse('Water boils at 100°C at sea level.', true),
      QuestionTrueFalse('Bats are blind.', false),
      QuestionTrueFalse(
        'The Great Wall of China is visible from space with the naked eye.',
        false,
      ),
      QuestionTrueFalse('The capital of Australia is Sydney.', false),
      QuestionTrueFalse('Humans have more than five senses.', true),
      QuestionTrueFalse('Water boils at 100°C at sea level.', true),
      QuestionTrueFalse('Bats are blind.', false),
      QuestionTrueFalse(
        'The Great Wall of China is visible from space with the naked eye.',
        false,
      ),
      QuestionTrueFalse('The capital of Australia is Sydney.', false),
      QuestionTrueFalse('Humans have more than five senses.', true),
      QuestionTrueFalse('Water boils at 100°C at sea level.', true),
      QuestionTrueFalse('Bats are blind.', false),
      QuestionTrueFalse(
        'The Great Wall of China is visible from space with the naked eye.',
        false,
      ),
    ];

    if (data.selectedLength == '5 questions') {
      questions = questions.sublist(0, 5);
    }
    if (data.selectedLength == '10 questions') {
      questions = questions.sublist(0, 10);
    }
    if (data.selectedLength == '15 questions') {
      questions = questions.sublist(0, 15);
    }
    if (data.selectedLength == '20 questions') {
      questions = questions.sublist(0, 20);
    }

    QuestionTrueFalse question = questions[currentQuestion];

    return <Widget>[
      Padding(
        padding: padding,
        child: Text(
          '${currentQuestion + 1}. ${question.question}',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text('True'),
        ),
      ),
      Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: () {},
          style: style,
          child: const Text('False'),
        ),
      ),
      (currentQuestion == questions.length -1)
          ? ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/study/quiz/end');
              },
              child: const Text('Finish'),
            )
          : ElevatedButton(onPressed: () {
                setState(() {
                  currentQuestion += 1;
                });
              }, child: const Text('Next')),
    ];
  }

  List<Widget> makeWR(QuizArguments data) {
    return <Widget>[
      Padding(
        padding: padding,
        child: const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Start typing here...',
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/study/quiz2');
        },
        child: const Text('Next'),
      ),
    ];
  }

  List<Widget> makeMatch(QuizArguments data) {
    return <Widget>[
      Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 163, 76, 175),
                    ),
                    child: const Text('Item 3'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 163, 76, 175),
                    ),
                    child: const Text('Item 1'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 163, 76, 175),
                    ),
                    child: const Text('Item 2'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 163, 76, 175),
                    ),
                    child: const Text('Item 4'),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Text('Item 4'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Text('Item 3'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Text('Item 2'),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.green),
                    child: const Text('Item 1'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }
}
