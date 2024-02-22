import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_event.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_state.dart';
import 'package:happy_catering/screens/home/components/HappyCateringCard.dart';
import 'package:happy_catering/screens/home/components/HappyCateringDataCard.dart';

class HappyCateringOrderCardCarousel extends StatefulWidget {
  const HappyCateringOrderCardCarousel({Key? key});

  @override
  State<HappyCateringOrderCardCarousel> createState() =>
      _HappyCateringOrderCardCarouselState();
}

class _HappyCateringOrderCardCarouselState
    extends State<HappyCateringOrderCardCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<CardBloc, CardState>(builder: (context, state) {
      context.read<CardBloc>().add(DisplayMealOrder());
      if (state is DisplayNoDataCardState) {
        return const HappyCateringEmptyCard();
      } else {
        final itemCount = (state as DisplayDataCardState).orders?.length;
        log(itemCount.toString());
        return SizedBox(
          height: 300, // Adjust the height as needed
          child: PageView.builder(
            itemCount: itemCount,
            controller: _controller,
            itemBuilder: (context, index) {
              return ListenableBuilder(
                  listenable: _controller,
                  builder: (context, child) {
                    double factor = 1;
                    if (_controller.position.hasContentDimensions) {
                      factor = 1 - (_controller.page! - index).abs();
                    }
                    return Center(
                        child: SizedBox(
                          height: 150, // Adjust the height as needed
                          child: HappyCateringDataCard(
                            dietName: state.orders?[index].dietName ?? '',
                            nextDeliveryAt: DateTime.now().add(
                                Duration(days: state.orders?[index].days ?? 0)),
                            pictureUrl:
                            "fedfwefw113r32f", //TODO need to place real url,
                            onShowMenuPressed: () {},
                          ),
                        ));
                  });
            },
          ),
        );
      }
    });
  }
}
