import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Core/widgets/custam_snak_bar.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_button.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_text_field.dart';
import 'package:fruits_store_dashboard/Core/widgets/Image_Field.dart';
import 'package:fruits_store_dashboard/Features/punner/domain/Entites/punner_entity.dart';

class AddPunnerViewBody extends StatefulWidget {
  const AddPunnerViewBody({super.key});

  @override
  State<AddPunnerViewBody> createState() => _AddPunnerViewBodyState();
}

class _AddPunnerViewBodyState extends State<AddPunnerViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String offerOne, offerTwo;
  File? image;
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
                onSaved: (value) {
                  offerOne = value!;
                },
                hintText: "نوع العرض",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  offerTwo = value!;
                },
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
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      PunnerEntity inputPunner = PunnerEntity(
                        namePunnerOne: offerOne,
                        namePunnerTwo: offerTwo,
                        image: image!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showErrorBar(context, "Please Select Product Image");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
