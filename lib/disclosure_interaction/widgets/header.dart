import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.expanded,
    required this.duration,
    required this.onPressed,
  });

  final bool expanded;
  final Duration duration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: expanded
          ? Container(
              height: 40,
              key: const Key('header'),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  const Text(
                    'Voice Chat',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          : const SizedBox(
              key: Key('sized-box'),
            ),
    );
  }
}
