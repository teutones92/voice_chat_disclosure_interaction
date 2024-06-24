import 'package:flutter/material.dart';

import 'sounding_icon_notify.dart';

class SecondAnimationInWrap extends StatelessWidget {
  const SecondAnimationInWrap({
    super.key,
    required AnimationController controller,
    required this.expanded,
    required this.newChildren,
    required this.hCount,
  }) : _controller = controller;

  final AnimationController _controller;
  final bool expanded;
  final List<Widget> newChildren;
  final int hCount;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _controller.duration!,
      child: expanded
          ? Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 10,
              children: List.generate(
                newChildren.length,
                (index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/200/300?random=$index'),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'User Name ${index + hCount}',
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
                        sounding: index == 1 || index == 2,
                      ),
                    ],
                  );
                },
              ),
            )
          : const SizedBox(
              key: Key('sized-box'),
            ),
    );
  }
}
