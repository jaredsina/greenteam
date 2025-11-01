import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:study_app_client/pages/quiz_button.dart';
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

  // State Variables
  int currentQuestion = 0;
  dynamic quizData;
  bool _loading = true;
  QuizArguments? _quizArgs;

  Future<void> fetchQuiz(QuizArguments? data) async {
    if (quizData != null || data == null) {
      print("Exit early");
      return;
    }
    setState(() {
      _loading = true;
    });
    print("Fetching data...");
    final url = Uri.parse(
      'http://localhost:4000/quiz/generate', // change base url and port to environment variable
    ); // Replace with your actual backend URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "difficulty": data.selectedDifficulty,
        "length": data.selectedLength,
        "type": data.selectedType,
        "topic": data.topic,
      }),
    );

    if (response.statusCode == 200) {
      print("Quiz Generated");
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        quizData = data;
      });
    } else {
      print('Error');
    }
    setState(() {
      _loading = false;
    });
  }

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

  List<Widget> getQuizType(QuizArguments arguments, dynamic QuizData) {
    String quizType = arguments.selectedType;

    if (quizType == "True/False") {
      return makeTF(arguments, QuizData);
    } else if (quizType == "Written Response") {
      return makeWR(arguments, QuizData);
    } else if (quizType == "Multiple Choice") {
      return makeMultipleChoice(arguments, QuizData);
    } else {
      throw Error();
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   if (_quizArgs != null) {
  //     print("here");
  //     fetchQuiz(_quizArgs);
  //   }
  // }
  //fetchQuiz();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final QuizArguments data =
        ModalRoute.of(context)?.settings.arguments as QuizArguments;
    print("here");
    fetchQuiz(data);
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
      body: !_loading
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getQuizType(data, quizData),
              ),
            )
          : Center(child: Text("Loading")),
    );
  }

  List<Widget> makeMultipleChoice(QuizArguments data, dynamic QuizData) {
    List<dynamic> dataQuestions = QuizData['questions'];
    List<QuestionMultipleChoice> questions = dataQuestions.map((question) {
      List<dynamic> dataOptions = question["option"];
      List<MultipleChoiceOption> options = dataOptions
          .map(
            (option) =>
                MultipleChoiceOption(option['value'], option['isCorrect']),
          )
          .toList();
      return QuestionMultipleChoice(question["question"], options);
    }).toList();
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
                  child: QuizButton(child: Text(question.options[0].value)),
                ),
                Expanded(
                  child: QuizButton(child: Text(question.options[1].value)),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: QuizButton(child: Text(question.options[2].value)),
                ),
                Expanded(
                  child:QuizButton(child: Text(question.options[3].value)),
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

  List<Widget> makeTF(QuizArguments data, dynamic QuizData) {
    List<dynamic> dataQuestions = QuizData['questions'];
    List<QuestionTrueFalse> questions = dataQuestions
        .map(
          (question) =>
              QuestionTrueFalse(question['question'], question['answer']),
        )
        .toList();

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
      QuizButton(child:Text("True")),
      QuizButton(child: Text("False")),
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

  List<Widget> makeWR(QuizArguments data, dynamic QuizData) {
    List<dynamic> dataQuestions = QuizData['questions'];
    List<QuestionWrittenResponse> questions = dataQuestions
        .map((question) => QuestionWrittenResponse(question["question"]))
        .toList();

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
}
