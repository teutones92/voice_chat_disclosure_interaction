import 'package:flutter/material.dart';

class SoundingIconNotify extends StatelessWidget {
  const SoundingIconNotify({
    super.key,
    required AnimationController controller,
    required this.expanded,
    required this.sounding,
  }) : _controller = controller;

  final AnimationController _controller;
  final bool expanded;
  final bool sounding;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: AnimatedSwitcher(
        duration: _controller.duration!,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: expanded && sounding
            ? Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Transform.scale(
                    scale: 3,
                    child: Image.asset(
                      "assets/sounding_icon.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
