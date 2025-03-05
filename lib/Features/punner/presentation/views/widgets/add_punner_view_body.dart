import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_button.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_text_field.dart';
import 'package:fruits_store_dashboard/Core/widgets/Image_Field.dart';

class AddPunnerViewBody extends StatefulWidget {
  const AddPunnerViewBody({super.key});

  @override
  State<AddPunnerViewBody> createState() => _AddPunnerViewBodyState();
}

class _AddPunnerViewBodyState extends State<AddPunnerViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              CustomTextFormField(
                hintText: "نوع العرض",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                hintText: "قيمه خصم العرض",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20.0,
              ),
              ImageField(
                onChanged: (value) {},
              ),
              SizedBox(
                height: 70.0,
              ),
              CustomButton(
                text: "إضافة",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
