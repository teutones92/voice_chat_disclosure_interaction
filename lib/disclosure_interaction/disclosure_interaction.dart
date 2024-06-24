import 'package:chat_interaction/disclosure_interaction/widgets/sounding_icon_notify.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class DiscInteract extends StatefulWidget {
  const DiscInteract({
    super.key = const Key('disc-interact'),
    required this.children,
    this.duration = const Duration(milliseconds: 500),
    this.size,
    this.hCount = 4,
  });
  final List children;
  final Duration duration;
  final Size? size;
  final int hCount;

  @override
  State<DiscInteract> createState() => _DiscInteractState();
}

class _DiscInteractState extends State<DiscInteract>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool expanded = false;
  final List<Widget> newChildren = [];

  @override
  void initState() {
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: widget.duration,
      vsync: this,
      value: 0.8,
      lowerBound: 0.8,
      upperBound: 1.09,
    );
    widget.children.removeRange(0, widget.hCount > 0 ? widget.hCount : 0);
    for (var element in widget.children) {
      newChildren.add(element);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleExpand() {
    if (expanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: expanded ? null : toggleExpand,
          child: AnimatedContainer(
            duration: _controller.duration!,
            curve: Curves.easeOut,
            width: widget.size?.width ?? 505,
            height: widget.size?.height ?? (expanded ? 500 : 110),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(expanded ? 20 : 80),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, snapshot) {
                  return AnimatedPadding(
                    duration: _controller.duration!,
                    padding: EdgeInsets.only(
                        left: expanded ? 40 : 4, top: expanded ? 60 : 4),
                    child: SingleChildScrollView(
                      physics: expanded
                          ? const BouncingScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FirstAnimationInRow(
                              widget: widget,
                              controller: _controller,
                              expanded: expanded),
                          const SizedBox(height: 6),
                          SecondAnimationInWrap(
                            controller: _controller,
                            expanded: expanded,
                            newChildren: newChildren,
                            hCount: widget.hCount,
                          ),
                          SizedBox(height: expanded ? 50 : 0),
                          !expanded
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child:
                                                  const Text('Join Voice Chat'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text("Mic is muted initially.")
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        SoundingIconNotify(
            controller: _controller, expanded: !expanded, sounding: true),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Header(
              expanded: expanded,
              duration: _controller.duration!,
              onPressed: toggleExpand),
        )
      ],
    );
  }
}
