import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/logic/blocs/card/card_bloc.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/buttons_screens/add_payment_screen.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
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
    context.read<CardBloc>().add(CardGetEvent());
  }

  String maskCardNumber(String cardNumber) {
    if (cardNumber.length < 4) {
      return cardNumber; // Return as is if card number is too short to mask
    }
    return '**** **** **** ' + cardNumber.substring(cardNumber.length - 4);
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
          print(state);
          if (state is CardError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is CardNothing) {
            return const Center(
              child: Text("You don't have any cards."),
            );
          }
          if (state is CardLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: state.cards.length,
                      itemBuilder: (context, index) {
                        final card = state.cards[index];
                        return Dismissible(
                          key: Key(
                              card.id.toString()), // Unique key for each card
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            context
                                .read<CardBloc>()
                                .add(CardDeleteEvent(cardId: card.card_number));
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
