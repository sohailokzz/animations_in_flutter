import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

const defaultWidth = 100.0;

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  var _zoomIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curves = Curves.bounceIn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              width: _width,
              curve: _curves,
              child: Image.asset('assets/images/walper.jpg'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _zoomIn = !_zoomIn;
                  _buttonTitle = _zoomIn ? 'Zoom Out' : 'Zoom In';
                  _width = _zoomIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curves = _zoomIn ? Curves.bounceInOut : Curves.bounceOut;
                });
              },
              child: Text(
                _buttonTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
