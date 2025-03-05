import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<File?> onChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? fileImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImage();
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.grey),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.file(fileImage!))
                  : Icon(
                      Icons.image_outlined,
                      size: 180.0,
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                color: Colors.red,
                onPressed: () {
                  fileImage = null;
                  widget.onChanged(fileImage);
                  setState(() {});
                },
                icon: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onChanged(fileImage);
  }
}
