// contact_us_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/contact_us_cubit.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: const _ContactUsView(),
    );
  }
}

class _ContactUsView extends StatelessWidget {
  const _ContactUsView();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("تواصل معنا", style: TextStyle(fontFamily: 'Shamel')),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<ContactUsCubit, ContactUsState>(
          listener: (context, state) {
            if (state is ContactUsSuccess) {
              _showSuccessDialog(context);
            }
          },
          child: const _ContactUsForm(),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'تم إرسال رسالتك',
                    style: TextStyle(
                      fontFamily: 'Shamel',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'تم',
                        style: TextStyle(
                          fontFamily: 'Shamel',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContactUsForm extends StatelessWidget {
  const _ContactUsForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactUsCubit>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            _CustomInput(controller: cubit.nameController, hint: 'الاسم'),
            const SizedBox(height: 30),
            _CustomInput(
              controller: cubit.contactController,
              hint: 'رقم الهاتف / البريد الإلكتروني',
            ),
            const SizedBox(height: 30),
            _CustomInput(
              controller: cubit.messageController,
              hint: 'ادخل الملاحظات',
              maxLines: 4,
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text("او تواصل معنا", style: TextStyle(fontFamily: 'Shamel')),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SocialIcon('assets/images/twitter.png'),
                _SocialIcon('assets/images/instagram.png'),
                _SocialIcon('assets/images/facebook.png'),
                _SocialIcon('assets/images/whatsapp.png'),
              ],
            ),
            const SizedBox(height: 160),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: state is ContactUsLoading ? null : cubit.submitForm,
                  child: state is ContactUsLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("ارسل", style: TextStyle(
                    fontFamily: 'Shamel',
                    color: Colors.white,
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const _CustomInput({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Shamel',
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String assetPath;

  const _SocialIcon(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: 36,
      height: 36,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, size: 36);
      },
    );
  }
}