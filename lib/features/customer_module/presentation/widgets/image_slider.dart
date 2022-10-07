import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/features/client_login/presentation/widgets/custom_text_view.dart';
import 'package:flutter_bloc_demo/features/customer_module/data/datamodels/portfolio_module.dart';
import 'package:flutter_bloc_demo/features/customer_module/presentation/page/customer_portfolio_details_page.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../../../utils/cosntants.dart';
import '../../data/datamodels/services_module.dart';
import 'image_shimmer.dart';

class ImageSlider extends StatefulWidget {
  List<PortfolioModule> response;
  ImageSlider({Key? key, required this.response}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      onTap: (index) {
        print('tapped at $index index');
      },
      autoplay: false,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CustomerPortfolioDetailsPage(
                      portfolioModule: widget.response[index],
                    )));
          },
          child: swiper_body_content(
            index: index,
          ),
        );
      },
      itemCount: widget.response.length,
      viewportFraction: 0.7,
      scale: 0.8,
    );
  }

  Widget swiper_body_content({required int index}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Constants.get_height(context) * 0.7,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              "${widget.response[index].serviceImages[0]}",
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) {
                print('${widget.response[index].serviceImages[0]}');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.photo_fill,
                      color: Color(Constants.secondoryDarkColorInt),
                      size: MediaQuery.of(context).size.width / 2,
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
        ),
        SizedBox(
          height: Constants.get_height(context) * 0.01,
        ),
        Text('${widget.response[index].serviceName}')
      ],
    );
  }
}
