// contact_us_cubit.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void submitForm() async {
    if (nameController.text.isEmpty ||
        contactController.text.isEmpty ||
        messageController.text.isEmpty) {
      emit(ContactUsError('الرجاء ملء جميع الحقول'));
      return;
    }

    emit(ContactUsLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Clear form on success
      nameController.clear();
      contactController.clear();
      messageController.clear();

      emit(ContactUsSuccess());
    } catch (e) {
      emit(ContactUsError('حدث خطأ أثناء الإرسال'));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    contactController.dispose();
    messageController.dispose();
    return super.close();
  }
}