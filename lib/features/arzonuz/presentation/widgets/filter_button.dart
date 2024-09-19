import 'package:arzonuz/features/arzonuz/presentation/blocs/cubits/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButtonWidget extends StatelessWidget {
  final String text;
  final int index;

  const FilterButtonWidget({
    super.key,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FilterCubit, int?>(
          builder: (context, selectedIndex) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => context.read<FilterCubit>().selectFilter(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? Colors.deepPurple : null,
                  border: Border.all(
                    color: isSelected ? Colors.deepPurple : Colors.black,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    if (isSelected)
                      const Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
