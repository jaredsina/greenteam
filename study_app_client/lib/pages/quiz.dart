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
  final ButtonStyle multipleChoiceStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.all(10),
    minimumSize: Size(100, 100),
  );
  final EdgeInsets padding = const EdgeInsets.all(10);
  int currentQuestion = 0;

  List getNumberQuestions(List questions, QuizArguments data) {
    if (data.selectedLength == '5 questions') {
      return questions.sublist(0, 5);
    } else if (data.selectedLength == '10 questions') {
      return questions.sublist(0, 10);
    } else if (data.selectedLength == '15 questions') {
      return questions.sublist(0, 15);
    } else {
      return questions.sublist(0, 20);
    }
  }

  List<MultipleChoiceOption> options = <MultipleChoiceOption>[
    MultipleChoiceOption('Option A', true),
    MultipleChoiceOption('Option B', false),
    MultipleChoiceOption('Option C', false),
    MultipleChoiceOption('Option D', false),
  ];

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
    List<QuestionMultipleChoice> questions = [
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
      QuestionMultipleChoice('dino', options),
    ];
    questions =
        getNumberQuestions(questions, data) as List<QuestionMultipleChoice>;
    QuestionMultipleChoice question = questions[currentQuestion];
    return <Widget>[
      Padding(padding: padding),
      Padding(
        padding: padding,
        child: Text(
          '${currentQuestion + 1}. ${question.question}',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: multipleChoiceStyle,
                      child: Text(question.options[0].value),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: multipleChoiceStyle,
                      child: Text(question.options[1].value),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: multipleChoiceStyle,
                      child: Text(question.options[2].value),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: multipleChoiceStyle,
                      child: Text(question.options[3].value),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      (currentQuestion == questions.length - 1)
          ? ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/study/quiz/end');
              },
              child: const Text('Finish'),
            )
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestion += 1;
                });
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

    questions = getNumberQuestions(questions, data) as List<QuestionTrueFalse>;

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
      (currentQuestion == questions.length - 1)
          ? ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/study/quiz/end');
              },
              child: const Text('Finish'),
            )
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestion += 1;
                });
              },
              child: const Text('Next'),
            ),
    ];
  }

  List<Widget> makeWR(QuizArguments data) {
    List<QuestionWrittenResponse> questions = [
      QuestionWrittenResponse('Explain why dinosaurs are extinct'),
      QuestionWrittenResponse('Explain why triangles have 3 sides'),
      QuestionWrittenResponse('Explain why shritan is always so late'),
      QuestionWrittenResponse('Explain how to make a pretzel'),
      QuestionWrittenResponse('Explain how to eat a cinnamon bun'),
      QuestionWrittenResponse('Explain why dinosaurs are extinct'),
      QuestionWrittenResponse('Explain why triangles have 3 sides'),
      QuestionWrittenResponse('Explain why shritan is always so late'),
      QuestionWrittenResponse('Explain how to make a pretzel'),
      QuestionWrittenResponse('Explain how to eat a cinnamon bun'),
      QuestionWrittenResponse('Explain why dinosaurs are extinct'),
      QuestionWrittenResponse('Explain why triangles have 3 sides'),
      QuestionWrittenResponse('Explain why shritan is always so late'),
      QuestionWrittenResponse('Explain how to make a pretzel'),
      QuestionWrittenResponse('Explain how to eat a cinnamon bun'),
      QuestionWrittenResponse('Explain why dinosaurs are extinct'),
      QuestionWrittenResponse('Explain why triangles have 3 sides'),
      QuestionWrittenResponse('Explain why shritan is always so late'),
      QuestionWrittenResponse('Explain how to make a pretzel'),
      QuestionWrittenResponse('Explain how to eat a cinnamon bun'),
    ];

    questions =
        getNumberQuestions(questions, data) as List<QuestionWrittenResponse>;

    QuestionWrittenResponse question = questions[currentQuestion];
    return <Widget>[
      Padding(
        padding: padding,
        child: Text(
          '${currentQuestion + 1}. ${question.question}',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        child: Padding(
          padding: padding,
          child: TextField(
            expands: true,
            minLines: null,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "Enter text",
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                // <-- adds the border
                borderRadius: BorderRadius.circular(12), // rounded corners
                borderSide: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
        ),
      ),

      (currentQuestion == questions.length - 1)
          ? ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/study/quiz/end');
              },
              child: const Text('Finish'),
            )
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestion += 1;
                });
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
