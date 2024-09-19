import 'package:arzonuz/features/arzonuz/data/models/product_model/product_responce.dart';
import 'package:arzonuz/features/arzonuz/presentation/blocs/product/product_bloc.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/back_button.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/button_with_elevation.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final pricewithotController = TextEditingController();

  final limitController = TextEditingController();
  final stockController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final sizeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Color selectedColor = Colors.blue;

  void submit() {
    print('object');
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<ProductBloc>().add(
            ProductAddEvent(
              productResponce: ProductResponce(
                color: [selectedColor.hashCode.toString()],
                description: descController.text,
                end_date: endDateController.text,
                limit_of_product: int.parse(limitController.text),
                price_without_stock: int.parse(pricewithotController.text),
                name: nameController.text,
                size: [sizeController.text],
                start_date: startDateController.text,
                stock: int.parse(stockController.text),
              ),
            ),
          );
    }
  }

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text("Add Product"),
      ),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message),
                );
              },
            );
          }
          if (state is ProductAddedState) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product name';
                      }
                      return null;
                    },
                    controller: nameController,
                    name: 'Name',
                    labelText: 'Enter product name',
                    filledColorbool: true,
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product description';
                      }
                      return null;
                    },
                    controller: descController,
                    name: 'Description',
                    labelText: 'Enter product description',
                    filledColorbool: true,
                  ),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    controller: priceController,
                    name: 'Price Without',
                    labelText: 'Enter price',
                    filledColorbool: true,
                    obscure: false,
                  ),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    controller: pricewithotController,
                    name: 'Price Without Stock',
                    labelText: 'Enter price',
                    filledColorbool: true,
                    obscure: false,
                  ),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product limit';
                      }
                      return null;
                    },
                    controller: limitController,
                    name: 'Limit of Product',
                    labelText: 'Enter product limit',
                    filledColorbool: true,
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please pick a start date';
                      }
                      return null;
                    },
                    controller: startDateController,
                    name: 'Start Date',
                    labelText: 'Pick a start date',
                    filledColorbool: true,
                    suffIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(startDateController),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please pick an end date';
                      }
                      return null;
                    },
                    controller: endDateController,
                    name: 'End Date',
                    labelText: 'Pick an end date',
                    filledColorbool: true,
                    suffIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(endDateController),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the stock quantity';
                      }
                      return null;
                    },
                    controller: stockController,
                    name: 'Stock',
                    labelText: 'Enter stock quantity',
                    filledColorbool: true,
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the size';
                      }
                      return null;
                    },
                    controller: sizeController,
                    name: 'Size',
                    labelText: 'Enter size',
                    filledColorbool: true,
                  ),
                  ListTile(
                    title: const Text(
                      'Color',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedColor),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.color_lens,
                        size: 45,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick a color'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: selectedColor,
                                  onColorChanged: (Color color) {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  },
                                  pickerAreaHeightPercent: 0.8,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Select'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 40),
                  ButtonWithElevation(
                    onPressed: () => submit(),
                    bgColor: Colors.deepPurple,
                    child: Text(
                      context.tr('continue'),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
