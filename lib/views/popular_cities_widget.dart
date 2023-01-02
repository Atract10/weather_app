import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';

class PopularCitiesWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  final ScrollController scrollController;
  const PopularCitiesWidget(
      {super.key, required this.viewModel, required this.scrollController});

  @override
  State<PopularCitiesWidget> createState() => _PopularCitiesWidgetState();
}

class _PopularCitiesWidgetState extends State<PopularCitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20, top: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Text(
            'Check the weather in most popular cities in the world',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 35),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.viewModel.popularCities.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(
                        widget.viewModel.popularCities[index].assetImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 14),
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        height: 36,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: TextButton(
                          child: Text(
                            widget.viewModel.popularCities[index].name,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            widget.viewModel.getWeaterAction(
                                widget.viewModel.popularCities[index].name);
                            widget.scrollController.animateTo(
                              0.0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
