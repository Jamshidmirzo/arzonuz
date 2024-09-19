import 'package:arzonuz/features/arzonuz/data/models/process_models/process_request.dart';
import 'package:arzonuz/features/arzonuz/data/models/product_model/product.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/card/card_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/process/process_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/pages/feedback_screen.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/button_with_elevation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyScreen extends StatefulWidget {
  final Product product;
  const BuyScreen({super.key, required this.product});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  String? _selectedCard;
  int amount = 0;

  submit() {
    if (_selectedCard != null) {
      context.read<ProcessBloc>().add(
            ProcessBuyEvent(
              processRequest: ProcessRequest(
                  amount: amount,
                  card_number: _selectedCard!,
                  product_id: widget.product.id),
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(CardGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text("Select a Card"),
      ),
      body: BlocListener<ProcessBloc, ProcessState>(
        listener: (context, state) {
          print(state);
          if (state is ProcessBuyedErrorState) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const Text('Hisobingizda yetaelri mablag` yoq');
              },
            );
          }
          if (state is ProcessErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.message),
                );
              },
            );
          }
          if (state is ProcessBuyedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FeedbackScreen();
                },
              ),
            );
          }
        },
        child: BlocBuilder<CardBloc, CardState>(
          builder: (context, state) {
            if (state is CardLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              amount++;
                              setState(() {});
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Text(
                            amount.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (amount != 0) {
                                amount--;
                              }
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                      subtitle: Text('${widget.product.price} sum'),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: widget.product.photos.isEmpty
                                ? const AssetImage('assets/images/nth.png')
                                : NetworkImage(widget.product.photos.first)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Choose your payment card:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedCard,
                      hint: const Text("Select a card"),
                      items: state.cards.map((card) {
                        return DropdownMenuItem<String>(
                          value: card.card_number,
                          child: Text(card.card_number),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedCard = value;
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    ButtonWithElevation(
                      onPressed: () => submit(),
                      bgColor: Colors.deepPurple.shade300,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Buy',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
