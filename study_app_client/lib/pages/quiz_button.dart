import 'package:flutter/material.dart';

final EdgeInsets padding = const EdgeInsets.all(10);

final ButtonStyle style = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  padding: const EdgeInsets.all(10),
  fixedSize: Size(200, 100),
);

final ButtonStyle selectedStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  padding: const EdgeInsets.all(10),
  fixedSize: Size(200, 100),
  backgroundColor: Colors.blue,
);

class QuizButton extends StatefulWidget {
  final Widget? child;

  const QuizButton({super.key, this.child});

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  bool buttonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            buttonSelected = !buttonSelected;
          });
        },
        style: buttonSelected ? selectedStyle : style,
        child: widget.child,
      ),
    );
  }
}
