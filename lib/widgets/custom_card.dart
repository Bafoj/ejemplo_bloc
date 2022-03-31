import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.6,
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(
          maxWidth: 700,
          maxHeight: 900,
          minWidth: 300,
          minHeight: 500,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 251, 251),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(71, 41, 41, 41),
              blurRadius: 3,
              spreadRadius: 7,
              offset: Offset(12, 10),
            )
          ],
        ),
        child: child);
  }
}
