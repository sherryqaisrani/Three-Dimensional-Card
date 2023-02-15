import 'package:flutter/material.dart';

class ThreeDimensionalCard extends StatefulWidget {
  const ThreeDimensionalCard({super.key});

  @override
  State<ThreeDimensionalCard> createState() => _ThreeDimensionalCardState();
}

class _ThreeDimensionalCardState extends State<ThreeDimensionalCard> {
  Offset location = Offset.zero;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const height = 256.0;
    final width = screenSize.width > 400 ? 400.0 : screenSize.width * 0.9;

    const cardHeight = height - 7;
    final cardWidth = width - 7;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 256,
            width: width,
            decoration: BoxDecoration(
              gradient: const SweepGradient(colors: [
                Colors.cyanAccent,
                Colors.pink,
                Colors.yellow,
                Colors.cyanAccent
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.002,
              )
              ..rotateX(
                0.001 * location.dy,
              )
              ..rotateY(
                -0.001 * location.dx,
              ),
            child: GestureDetector(
              onPanUpdate: (details) {
                location += details.delta;
                setState(() {});
              },
              onPanEnd: (details) {
                location = Offset.zero;
                setState(() {});
              },
              child: Container(
                height: cardHeight,
                width: cardWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 20,
                              width: 80 * 2,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
