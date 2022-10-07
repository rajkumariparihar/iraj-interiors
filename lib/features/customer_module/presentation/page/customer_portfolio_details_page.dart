import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_sized_boxes.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/custome_text_widget_options.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/widgets/image_shimmer.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';
import 'package:flutter_bloc_demo/utils/string_constants.dart';

class CustomerPortfolioDetailsPage extends StatefulWidget {
  PortfolioModule portfolioModule;
  CustomerPortfolioDetailsPage({Key? key, required this.portfolioModule})
      : super(key: key);

  @override
  _CustomerPortfolioDetailsPageState createState() =>
      _CustomerPortfolioDetailsPageState();
}

class _CustomerPortfolioDetailsPageState
    extends State<CustomerPortfolioDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.whiteColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Constants.primaryDarkColor,
            centerTitle: false,
            title: Text(StringConstants.portfolio)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeTextWidgetOptions(
                    font_color: Constants.primaryColor,
                    text: '${widget.portfolioModule.serviceType}',
                    fontSize: 50),
                CustomSizedBoxes(
                  height: 20,
                ),
                CustomeTextWidgetOptions(
                    font_color: Constants.primaryColor,
                    text: '${widget.portfolioModule.serviceName}',
                    fontSize: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomeTextWidgetOptions(
                        font_color: Constants.primaryColor,
                        text: '${widget.portfolioModule.serviceDuration}',
                        fontSize: 25),
                    CustomSizedBoxes(
                      width: 5,
                    ),
                    CustomeTextWidgetOptions(
                        font_color: Constants.primaryColor,
                        text: 'Days',
                        fontSize: 17),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.portfolioModule.serviceImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: ((context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            "${widget.portfolioModule.serviceImages[index]}",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CupertinoIcons.photo_fill,
                                    color: Constants.primaryColor,
                                  ),
                                  CustomTextView(
                                    text: 'Image Loading\nFailed',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(child: ImageShimmer());
                            },
                          ),
                        ),
                      );
                    }))
              ],
            ),
          ),
        ));
  }
}
