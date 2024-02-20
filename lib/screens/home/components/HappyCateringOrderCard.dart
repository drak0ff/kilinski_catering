import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_bloc.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_event.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_state.dart';
import 'package:happy_catering/screens/home/components/HappyCateringEmpyCard.dart';

class HappyCateringOrderCard extends StatefulWidget {
  const HappyCateringOrderCard({super.key});

  @override
  State<HappyCateringOrderCard> createState() => _HappyCateringOrderCardState();
}

class _HappyCateringOrderCardState extends State<HappyCateringOrderCard> {
  final PageController _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<CardBloc, CardState>(builder: (context, state) {
      context.read<CardBloc>().add(DisplayMealOrder());
      if (state is DisplayNoDataCardState) {
        return HappyCateringEmpyCard();
      } else {
        final itemCount = (state as DisplayDataCardState).orders?.length;
        log(itemCount.toString());
        return SizedBox(
          height: 100,
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
                            height: 70 + (factor * 30),
                            child: Card(
                              elevation: 4,
                              child: Center(
                                child: Text('Card $index'),
                              ),
                            )));
                  });
            },
          ),
        );
      }
    });
  }
}
