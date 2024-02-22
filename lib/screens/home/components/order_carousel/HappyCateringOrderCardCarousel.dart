import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_event.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_state.dart';
import 'package:happy_catering/screens/home/components/order_carousel/HappyCateringDataCard.dart';
import 'package:intl/intl.dart';

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
    return BlocBuilder<CardBloc, CardState>(builder: (context, state) {
      context.read<CardBloc>().add(DisplayMealOrder());
      if (state is DisplayNoDataCardState) {
        return HappyCateringDataCard(hasData: false);
      } else {
        final itemCount = (state as DisplayDataCardState).orders?.length;
        return GestureDetector(
          onTap: () {
            print('Clicked');
          },
          child: Container(
            height: 200, // Fixed height to avoid overflow
            child: PageView.builder(
              itemCount: itemCount,
              controller: _controller,
              itemBuilder: (context, index) {
                return ListenableBuilder(
                  listenable: _controller,
                  builder: (context, child) {
                    final order = state.orders?[index];
                    final formattedDate = _formatDate(DateTime.now());
                    return Center(
                      child: SizedBox(
                        height: 400, // Adjust the height as needed
                        child: HappyCateringDataCard(
                          orderName: order?.dietName ?? '',
                          nextDeliveryAt: formattedDate,
                          hasData: true, // TODO: need to place real URL
                        ),
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

  String _formatDate(DateTime? date) {
    if (date == null) return '';

    final now = DateTime.now();
    final difference = date.difference(now);

    if (difference.inDays == 0) {
      // Today with time
      return 'Today ${DateFormat.jm().format(date)}';
    } else if (difference.inDays == 1) {
      // Tomorrow with time
      return 'Tomorrow ${DateFormat.jm().format(date)}';
    } else {
      // Weekday with time
      return DateFormat('EEEE ${DateFormat.jm().pattern}').format(date);
    }
  }
}
