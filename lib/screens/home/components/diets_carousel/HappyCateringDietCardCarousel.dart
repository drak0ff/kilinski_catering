import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/diet_card_bloc/diet_card_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/diet_card_bloc/diet_card_state.dart';

import '../../../../blocs/components_bloc/diet_card_bloc/diet_card_event.dart';
import 'HappyCateringDietDataCard.dart';

class HappyCateringDietCardCarousel extends StatefulWidget {
  const HappyCateringDietCardCarousel({Key? key});

  @override
  State<HappyCateringDietCardCarousel> createState() =>
      _HappyCateringDietCardCarouselState();
}

class _HappyCateringDietCardCarouselState
    extends State<HappyCateringDietCardCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCardBloc, DietCardState>(builder: (context, state) {
      context.read<DietCardBloc>().add(DisplayDietCard());
      if (state is DisplayNoDataDietCardState) {
        return const HappyCateringDietDataCard(
          hasData: false,
        );
      } else {
        final itemCount =
            (state as DisplayDataDietCardState).dietsNames?.length;
        return SizedBox(
          height: 300,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
            child: PageView.builder(
              itemCount: itemCount,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListenableBuilder(
                  listenable: _controller,
                  builder: (context, child) {
                    final order = state.dietsNames?[index];
                    return Center(
                      child: SizedBox(
                        height: 400,
                        child: HappyCateringDietDataCard(
                          hasData: true,
                          bottomText: order.toString(),
                          pictureUrl: "assets/img/" + order.toString() + '.png',
                        ), // TODO: need to place real URL
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      }
    });
  }
}
