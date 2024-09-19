import 'package:arzonuz/features/arzonuz/presentation/blocs/cubits/button_cubit.dart';
import 'package:arzonuz/features/arzonuz/presentation/pages/splash_screen/bottom_nav_bar_screen.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/button_with_elevation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TellUsScreen extends StatefulWidget {
  const TellUsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TellUsScreenState createState() => _TellUsScreenState();
}

class _TellUsScreenState extends State<TellUsScreen> {
  String? _selectedAgeRange;
  final _formKey = GlobalKey<FormState>();
  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final selectedButtonIndex = context.read<ButtonCubit>().state;
      // ignore: unused_local_variable
      final selectedGender = selectedButtonIndex == 0 ? 'Men' : 'Women';
      // ignore: unused_local_variable
      final ageRange = _selectedAgeRange ?? 'Not specified';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const BottomNavBarScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('tellUs'),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  context.tr('tellUsfirst'),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(context, 0, context.tr('man')),
                    _buildButton(context, 1, context.tr('woman')),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  context.tr('tellUssecond'),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildDropdownButton(context),
                const SizedBox(
                  height: 20,
                ),
                ButtonWithElevation(
                  onPressed: () => submit(context),
                  bgColor: Colors.deepPurple.shade300,
                  child: Text(
                    context.tr('finish'),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, int index, String text) {
    return BlocBuilder<ButtonCubit, int>(
      builder: (context, selectedIndex) {
        bool isSelected = selectedIndex == index;
        return ZoomTapAnimation(
          onTap: () => context.read<ButtonCubit>().selectButton(index),
          child: Container(
            width: 190,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: isSelected ? null : Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(40),
              color: isSelected ? Colors.deepPurple.shade300 : Colors.white,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedAgeRange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Choice your age';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Age Range',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: ['18-25', '26-35', '36-45', '46+'].map((ageRange) {
        return DropdownMenuItem<String>(
          value: ageRange,
          child: Text(ageRange),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedAgeRange = value;
        });
      },
    );
  }
}
