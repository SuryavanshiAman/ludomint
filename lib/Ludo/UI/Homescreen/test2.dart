import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';


class mysplsh extends StatelessWidget {
  const mysplsh({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget and text animator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: TextAnimator(
          widget.title,
          atRestEffect: WidgetRestingEffects.wave(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: SizedBox(),
            ),
            TextAnimator(
              'You have pushed the button this many times:',
              atRestEffect: WidgetRestingEffects.pulse(effectStrength: 0.6),
              style: Theme.of(context).textTheme.bodyMedium,
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                  blur: const Offset(0, 20), scale: 2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextAnimator(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 1500)),
              atRestEffect: WidgetRestingEffects.dangle(),
              outgoingEffect: WidgetTransitionEffects.outgoingSlideOutToRight(),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects(
                  delay: const Duration(milliseconds: 1500),
                  offset: const Offset(0, -30),
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 900)),
              atRestEffect: WidgetRestingEffects.wave(),
              child: ElevatedButton(
                  child: const Text('Samples'),
                  onPressed: () {
                    // Navigator.of(context).push(Samples.route());
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects(
                  delay: const Duration(milliseconds: 1500),
                  offset: const Offset(0, 30),
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1200)),
              child: GestureAnimator(
                curve: Curves.easeInOut,
                scaleSize: 0.9,
                yOffset: -5,
                duration: const Duration(milliseconds: 150),
                onLongPress: (){
                  print('on long press triggered');
                },
                onTapDown: (_){
                  print('on tap down');
                },
                onTapUp: (_){
                  print('on tap up');
                },

                // blurX: 2,
                // blurY: 2,
                numberOfPlays: 1,
                // rotation: pi / 16,
                opacity: 0.8,
                // skewX: 0.2,
                hapticFeedback: HapticFeedback.selectionClick,
                triggerOnTapAfterAnimationComplete: true,
                onTap: () {
                  // Navigator.of(context).push(Samples.route());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'GestureAnimator',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton:
      WidgetAnimator(
        atRestEffect: WidgetRestingEffects.size(),
        child: FloatingActionButton(
          isExtended: true,
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}