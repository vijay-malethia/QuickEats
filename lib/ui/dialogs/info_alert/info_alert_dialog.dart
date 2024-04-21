import 'package:flutter/material.dart';
import 'package:quick_eats/ui/common/app_colors.dart';
import 'package:quick_eats/ui/common/ui_helpers.dart';
import 'package:quick_eats/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InfoAlertDialog extends StackedView<HomeViewModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rate Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                    InkWell(
                      onTap: () => completer(DialogResponse(
                        confirmed: false,
                      )),
                      child: const Icon(Icons.close, size: 20),
                    )
                  ],
                ),
              ),
              const Divider(thickness: 1),
              verticalSpaceSmall,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Share your review to help others',
                  style: TextStyle(fontSize: 14, color: kcMediumGrey),
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              viewModel.onStarRatingChange(index);
                            },
                            child: index < viewModel.starRating
                                ? const Icon(Icons.star_rate,
                                    size: 24, color: Colors.orange)
                                : const Icon(
                                    Icons.star_rate_outlined,
                                    size: 24,
                                    color: Colors.grey,
                                  ),
                          ),
                        )),
              ),
            ],
          ),
          verticalSpaceSmall,
          const Divider(thickness: 1),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                viewModel.saveRating(request.data);
                viewModel.addStar(request.description!, request.data);
                completer(DialogResponse(
                  confirmed: true,
                ));
              },
              child: Container(
                height: 30,
                width: 80,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          verticalSpaceSmall
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
