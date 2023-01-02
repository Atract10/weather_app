import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';

class SearchResultsWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  final TextEditingController textController;
  const SearchResultsWidget(
      {super.key, required this.viewModel, required this.textController});

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.viewModel.listCities.isEmpty)
        ? Material(
            elevation: 5.0,
            shadowColor: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Container(
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'City not found, please try to change your search query',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 200,
            child: Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: widget.viewModel.listCities.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 5,
                      top: 5,
                    ),
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          color: widget.viewModel.listCities[index].isOpened
                              ? widget.viewModel.widgetColor
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            textAlign: TextAlign.left,
                            '${widget.viewModel.listCities[index].cityName}, ${widget.viewModel.listCities[index].country}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: widget.viewModel.listCities[index].isOpened
                                  ? widget.viewModel.textColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.viewModel.listCities[index].isOpened =
                            !widget.viewModel.listCities[index].isOpened;
                        widget.viewModel.getWeaterAction(
                            widget.viewModel.listCities[index].cityName);
                        FocusScope.of(context).unfocus();
                        widget.textController.clear();
                        widget.viewModel
                            .getListCitiesAction(widget.viewModel.searchInput);
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
