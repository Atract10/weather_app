import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';

class FooterWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  const FooterWidget({super.key, required this.viewModel});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 0.85),
      ),
      child: Center(
        child: Text(
          'Illia Halushkin - ${widget.viewModel.year}',
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
