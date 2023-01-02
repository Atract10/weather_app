import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const <Widget>[
            Spacer(),
            CircularProgressIndicator(
              color: Color(0xFFBFDCE8),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}