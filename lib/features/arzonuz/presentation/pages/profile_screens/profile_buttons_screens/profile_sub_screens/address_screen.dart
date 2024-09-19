import 'package:arzonuz/features/arzonuz/presentation/pages/profile_screens/profile_buttons_screens/buttons_screens/add_address_screen.dart';
import 'package:arzonuz/features/arzonuz/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
                return AddAddressScreen();
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
          "Address",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Uzbekistan,Tashkent,Mirzo Ulug`bek,Ahmad Yugnakiy',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Edit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
