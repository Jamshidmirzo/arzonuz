import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/features/arzonuz/card/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/card/presentation/pages/add_payment_screen.dart';
import 'package:arzonuz/features/arzonuz/home/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(CardEvent.cardGetEvent());
  }

  String maskCardNumber(String cardNumber) {
    if (cardNumber.length < 4) {
      return cardNumber; 
    }
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddPaymentScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButtonWidget(),
        title: const Text(
          "Payment",
        ),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.status==StatusCard.ERROR ) {
            return Center(
              child: Text(state.message ?? ''),
            );
          }
          if (state.status ==StatusCard.ERROR ) {
            return const Center(
              child: Text("You don't have any cards."),
            );
          }
          if (state.status==StatusCard.SUCCESS ) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: state.cards!.length,
                      itemBuilder: (context, index) {
                        final card = state.cards![index];
                        return Dismissible(
                          key: Key(
                              card.id.toString()),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            context.read<CardBloc>().add(
                                  CardEvent.carddeleteEvent(card.card_number),
                                );
                          },
                          child: ZoomTapAnimation(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 19),
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AdaptiveTheme.of(context).mode ==
                                        AdaptiveThemeMode.light
                                    ? Colors.grey.shade300
                                    : const Color(0xFF342F3F),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    maskCardNumber(card.card_number),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/uzcard.png'),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/icons/back_v.png',
                                    color: AdaptiveTheme.of(context).mode ==
                                            AdaptiveThemeMode.light
                                        ? const Color(0xFF342F3F)
                                        : Colors.grey.shade300,
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
