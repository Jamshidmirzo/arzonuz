import 'dart:io';
import 'package:arzonuz/data/models/auth_models/update_profile_request.dart';
import 'package:arzonuz/data/models/auth_models/user_model.dart';
import 'package:arzonuz/logic/blocs/user/user_bloc.dart';
import 'package:arzonuz/ui/widgets/back_button.dart';
import 'package:arzonuz/ui/widgets/button_with_elevation.dart';
import 'package:arzonuz/ui/widgets/text_input_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    addressController.text = widget.user.address;
    phoneController.text = widget.user.phone;
    nameController.text = widget.user.fullname;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<UserBloc>().add(
            UserUpdateUserEvent(
              updateProfileRequest: UpdateProfileRequest(
                address: addressController.text,
                fullname: nameController.text,
                id: '',
                phone: phoneController.text,
                photo: '',
              ),
            ),
          );
      if (_selectedImage != null) {
        print(_selectedImage);
        context.read<UserBloc>().add(
              UserUpdatePhotoEvent(
                file: File(_selectedImage!.path),
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: Text(context.tr('eprofile')),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(state.message),
                );
              },
            );
          }
          if (state is UserUpdated) {
            Navigator.pop(context);
            context.read<UserBloc>().add(
                  UserGetUserEvent(),
                );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('eprofile'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const SizedBox(height: 32),
                TextInputWidget(
                  controller: nameController,
                  name: context.tr('name'),
                  labelText: 'Name',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Input your name';
                    }
                    return null;
                  },
                ),
                TextInputWidget(
                  controller: phoneController,
                  name: context.tr('phone'),
                  labelText: 'Phone',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Input your phone number';
                    }
                    return null;
                  },
                ),
                TextInputWidget(
                  controller: addressController,
                  name: context.tr('address'),
                  labelText: 'Address',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Input your address';
                    }
                    return null;
                  },
                ),
                const Text(
                  'Change Photo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ZoomTapAnimation(
                      onTap: _pickImageCamera,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.camera_alt),
                              Text(
                                context.tr('cm'),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: _pickImage,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 170,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.photo),
                              Text(
                                context.tr('gl'),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ButtonWithElevation(
                  onPressed: () => submit(context),
                  bgColor: Colors.deepPurple.shade300,
                  child: Text(
                    context.tr('edit'),
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
}
