import 'package:flutter/material.dart';

import '../disclosure_interaction.dart';
import 'sounding_icon_notify.dart';

class FirstAnimationInRow extends StatelessWidget {
  const FirstAnimationInRow({
    super.key,
    required this.widget,
    required AnimationController controller,
    required this.expanded,
  }) : _controller = controller;

  final DiscInteract widget;
  final AnimationController _controller;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(widget.hCount, (index) {
        return Align(
          widthFactor: _controller.value,
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/200/300?random=${index + widget.hCount}'),
                      radius: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'User Name $index',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SoundingIconNotify(
                controller: _controller,
                expanded: expanded,
                sounding: index == 0 || index == 3,
              ),
            ],
          ),
        );
      }),
    );
  }
}
