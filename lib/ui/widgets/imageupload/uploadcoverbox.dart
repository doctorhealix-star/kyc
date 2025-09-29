import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:kyc/core/constant/color.dart';

class UploadCoverBox extends StatefulWidget {
  const UploadCoverBox({super.key});

  @override
  State<UploadCoverBox> createState() => _UploadCoverBoxState();
}

class _UploadCoverBoxState extends State<UploadCoverBox> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: DottedBorder(
        options:RoundedRectDottedBorderOptions(
          dashPattern: [10, 5],
          strokeWidth: 2,
          radius: Radius.circular(12),
          color: grey,
          padding: EdgeInsets.all(0),
        ),
        // borderType: BorderType.RRect,
        // radius: const Radius.circular(12),
        // dashPattern: const [6, 4],
        // color: Colors.grey,
        // strokeWidth: 1.5,
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
          ),
          child: _imageFile == null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_upload, size: 50, color: primary),
              const SizedBox(height: 8),
              const Text(
                "Upload Cover",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Click here to upload cover photo",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              _imageFile!,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 130,
            ),
          ),
        ),
      ),
    );
  }
}
