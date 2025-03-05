import 'package:flutter/material.dart';
import 'package:fruits_store_dashboard/Core/widgets/custom_text_field.dart';
import 'package:fruits_store_dashboard/Core/widgets/Image_Field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                hintText: "Product Name",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Product Code",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Product Price",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Expiration Months",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Number Of Callorys",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Unit Ammount",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: "Product Describtion",
                textInputType: TextInputType.text,
                maxLine: 5,
              ),
              SizedBox(
                height: 16.0,
              ),
              ImageField(
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
