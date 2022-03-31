import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  final bool done;
  const Task({
    Key? key,
    required this.title,
    required this.onTap,
    required this.onDelete,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: done
              ? const Color.fromARGB(255, 160, 243, 208)
              : const Color.fromARGB(255, 245, 245, 245),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Material(
          // elevation: 5,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(done
                      ? Icons.check_circle_outline
                      : Icons.circle_outlined),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
