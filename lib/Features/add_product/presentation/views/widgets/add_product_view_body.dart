import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store_dashboard/Core/widgets/custam_snak_bar.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_button.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_text_field.dart';
import 'package:fruits_store_dashboard/Core/widgets/Image_Field.dart';
import 'package:fruits_store_dashboard/Features/add_product/domain/Entites/Product_Entity.dart';
import 'package:fruits_store_dashboard/Features/add_product/presentation/manager/addproductCubit/addproduct_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonthly, numberOfCallorys, unitAmmount;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: "Product Name",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: "Product Code",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: "Product Price",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonthly = num.parse(value!);
                },
                hintText: "Expiration Months",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCallorys = num.parse(value!);
                },
                hintText: "Number Of Callorys",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmmount = num.parse(value!);
                },
                hintText: "Unit Ammount",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: "Product Describtion",
                textInputType: TextInputType.text,
                maxLine: 5,
              ),
              SizedBox(
                height: 16.0,
              ),
              ImageField(
                onChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomButton(
                text: "Add Produt",
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ProductEntity input = ProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        expirationsMonths: expirationMonthly.toInt(),
                        numberOfCalories: numberOfCallorys.toInt(),
                        unitAmount: unitAmmount.toInt(),
                        price: price,
                        image: image!,
                      );
                      context.read<AddproductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showErrorBar(context, "Please Select Product Image");
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
