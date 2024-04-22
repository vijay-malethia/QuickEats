import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

//
import 'package:quick_eats/ui/common/ui_helpers.dart';
import 'package:quick_eats/ui/widgets/star_rating.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : renderBody(viewModel),
    );
  }

  SafeArea renderBody(HomeViewModel viewModel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all()),
              child: const Text('Quick Eats'),
            ),
            verticalSpaceSmall,
            const Text(
              'Restaurants',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            verticalSpaceSmall,
            renderRestaurants(viewModel),
          ],
        ),
      ),
    );
  }

  Expanded renderRestaurants(HomeViewModel viewModel) {
    return Expanded(
      child: ListView.separated(
        itemCount: viewModel.restaurantList.length,
        separatorBuilder: (context, index) => verticalSpaceSmall,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Image.network(
                      viewModel.restaurantList[index]['image_url'],
                      fit: BoxFit.cover)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.restaurantList[index]['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      viewModel.restaurantList[index]['desc'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    verticalSpaceSmall,
                    Text(
                      '${viewModel.calCulateRating(index).toString()}.0',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Based on ${viewModel.ratingList[index]['averageRating'].length} reviews",
                      style: const TextStyle(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StarRating(
                            starRating: viewModel.calCulateRating(index)),
                        InkWell(
                          onTap: () => viewModel.showDialog(
                              viewModel.restaurantList[index]['id']),
                          child: const Text(
                            'Rate Now',
                            style: TextStyle(
                                color: Colors.blue,
                                decorationColor: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel()..getAllRestaurants();
}
