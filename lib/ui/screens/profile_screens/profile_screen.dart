import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:arzonuz/logic/blocs/auth/auth_bloc.dart';
import 'package:arzonuz/logic/blocs/user/user_bloc.dart';
import 'package:arzonuz/ui/screens/auth_screens/login_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/buttons_screens/add_product_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/buttons_screens/see_my_products.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/address_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/edit_profile_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/payment_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/settings_screen.dart';
import 'package:arzonuz/ui/screens/profile_screens/profile_buttons_screens/profile_sub_screens/wishlist_screen.dart';
import 'package:arzonuz/ui/widgets/profile_buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool itSeller = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSellerStatus();
  }

  Future<void> _loadSellerStatus() async {
    print("bunga keldi");
    context.read<UserBloc>().add(UserGetUserEvent());
    final shared = await SharedPreferences.getInstance();
    String? itsSellerfromShared = shared.getString('seller');
    setState(() {
      itSeller = itsSellerfromShared != null;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserError) {
                  return Center(
                    child: Text(
                      state.message,
                    ),
                  );
                }

                if (state is UserLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserLoaded) {
                  final user = state.user;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? const Color(0xFF342F3F)
                                      : Colors.grey.shade300,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: user.photo.isNotEmpty
                                        ? const AssetImage(
                                            'assets/images/bro.png')
                                        : NetworkImage(user.photo)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 13),
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? Colors.grey.shade300
                                  : const Color(0xFF342F3F),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.fullname,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      user.email,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return EditProfileScreen(
                                                user: user,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        context.tr('edit'),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  user.phone,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          user.role == 'seller'
                              ? ProfileButtons(
                                  text: context.tr('addp'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const AddProductScreen();
                                        },
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox(),
                          user.role == 'seller'
                              ? ProfileButtons(
                                  text: 'See my products',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const SeeMyProducts();
                                        },
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox(),
                          ProfileButtons(
                            text: context.tr('set'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SettingsScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          ProfileButtons(
                            text: context.tr('address'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const AddressScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          ProfileButtons(
                            text: context.tr('wish'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const WishlistScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          ProfileButtons(
                            text: context.tr('pay'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const PaymentScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          ProfileButtons(
                            text: context.tr('sp'),
                          ),
                          Center(
                            child: TextButton(
                              child: Text(
                                context.tr('out'),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthLogoutEvent());
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
    );
  }
}
