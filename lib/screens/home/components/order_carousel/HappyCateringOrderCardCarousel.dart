import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/order_card_bloc/order_card_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/order_card_bloc/order_card_event.dart';
import 'package:happy_catering/blocs/components_bloc/order_card_bloc/order_card_state.dart';
import 'package:happy_catering/screens/home/components/order_carousel/HappyCateringOrderDataCard.dart';
import 'package:intl/intl.dart';

class HappyCateringOrderCardCarousel extends StatefulWidget {
  const HappyCateringOrderCardCarousel({super.key});

  @override
  State<HappyCateringOrderCardCarousel> createState() =>
      _HappyCateringOrderCardCarouselState();
}

class _HappyCateringOrderCardCarouselState
    extends State<HappyCateringOrderCardCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCardBloc, OrderCardState>(
        builder: (context, state) {
      context.read<OrderCardBloc>().add(DisplayMealOrderCard());
      if (state is DisplayNoDataOrderCardState) {
        return HappyCateringOrderDataCard(hasData: false);
      } else {
        final itemCount = (state as DisplayDataOrderCardState).orders?.length;
        return GestureDetector(
          onTap: () {
            print('Clicked'); // TODO: Implement action
          },
          child: SizedBox(
            height: 200,
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
                        height: 400,
                        child: HappyCateringOrderDataCard(
                          orderName: order?.dietName ?? '',
                          nextDeliveryAt: formattedDate,
                          imageUrl: order?.dietName,
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
      return 'Today ${DateFormat.jm().format(date)}';
    } else if (difference.inDays == 1) {
      return 'Tomorrow ${DateFormat.jm().format(date)}';
    } else {
      return DateFormat('EEEE ${DateFormat.jm().pattern}').format(date);
    }
  }
}
