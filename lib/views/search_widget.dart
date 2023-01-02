import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';
import '../icons/custom_icons_icons.dart';

class SearchWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  final TextEditingController textController;

  const SearchWidget(
      {super.key, required this.viewModel, required this.textController});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (input) {
        widget.viewModel.getWeaterAction(input);
        FocusScope.of(context).unfocus();
        widget.textController.clear();
        widget.viewModel.getListCitiesAction(input);
      },
      onChanged: (value) => widget.viewModel.getListCitiesAction(value),
      controller: widget.textController,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20.0),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
              color: widget.viewModel.widgetColor,
            ),
            child: IconButton(
                icon: const Icon(
                  CustomIcons.search,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () {
                  widget.viewModel
                      .getListCitiesAction(widget.viewModel.searchInput);
                  FocusScope.of(context).unfocus();
                  widget.textController.clear();
                  widget.viewModel
                      .getListCitiesAction(widget.viewModel.searchInput);
                }),
          ),
        ),
        hintText: 'Start typing to search...',
        hintStyle: const TextStyle(
            fontFamily: 'Roboto', fontSize: 16, color: Color(0xFF9E9E9E)),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
