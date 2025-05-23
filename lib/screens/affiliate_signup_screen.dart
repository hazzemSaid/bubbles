import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/snackbar_helper.dart';
import 'package:bubbels/widgets/CustomTextFromField.dart';
import 'package:bubbels/widgets/LoadingWidgetAnimation.dart';
import 'package:bubbels/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class AffiliateSignUp extends StatefulWidget {
  const AffiliateSignUp({super.key});
  static const String routeName = '/affiliate-signup';

  @override
  State<AffiliateSignUp> createState() => _AffiliateSignUpState();
}

class _AffiliateSignUpState extends State<AffiliateSignUp> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedGender = 'Gender'; // Default value
  File? cvFile;
  String? cvFileName;
  bool agreeToTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleUploadCV() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          cvFile = File(result.files.single.path!);
          cvFileName = result.files.single.name;
        });

        SnackBarHelper.showSnackBar(
          context: context,
          message: "CV file selected: $cvFileName",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      SnackBarHelper.showSnackBar(
        context: context,
        message: "Error selecting CV: ${e.toString()}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void _handleSubmit() {
    if (formKey.currentState!.validate()) {
      if (!agreeToTerms) {
        SnackBarHelper.showSnackBar(
          context: context,
          message: "Please agree to Terms of Service and Privacy Policy",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      // Show loading animation
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const LoadingWidgetAnimation(),
      );

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        if (Navigator.canPop(context)) Navigator.of(context).pop();

        SnackBarHelper.showSnackBar(
          context: context,
          message: "Affiliate application submitted successfully",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        // Navigate back or to confirmation page
        context.pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.iconTheme.color, size: 24),
          onPressed: () => context.pop(),
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(), // Removes minimum size constraints
          splashRadius: 28,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: const ThemeToggleIcon(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Become an Affiliate",
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 24.sp,
                    color: colorScheme.onSurface,
                  ),
                ),

                SizedBox(height: 20.h),

                // Logo
                SizedBox(
                  width: 90.w,
                  height: 90.h,
                  child: Image.asset(
                    'assets/images/logo1.png',
                    fit: BoxFit.fill,
                  ),
                ),

                SizedBox(height: 30.h),

                // Form
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Name field
                      CustomTextFromField(
                        keys: const PageStorageKey('name'),
                        controller: nameController,
                        hintText: 'Enter your Name',
                        LabelText: 'Name',
                        obscureText: false,
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15.h),

                      // Age field (separate)
                      CustomTextFromField(
                        keys: const PageStorageKey('age'),
                        controller: ageController,
                        hintText: 'Enter your Age',
                        LabelText: 'Age',
                        obscureText: false,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15.h),

                      // Gender dropdown
                      Container(
                        width: double.infinity,
                        height: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.brightness == Brightness.dark
                                ? colorScheme.onSurface.withOpacity(0.3)
                                : AppColors.grayChateau,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedGender,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.luxorGold,
                            ),
                            isExpanded: true,
                            dropdownColor: theme.scaffoldBackgroundColor,
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.paleSky,
                            ),
                            items: ['Male', 'Female'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: theme.brightness == Brightness.dark
                                        ? colorScheme.onSurface
                                        : AppColors.paleSky,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              }
                            },
                            hint: Text(
                              'Select Gender',
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 16.sp,
                                color: colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15.h),

                      // Phone Number field
                      CustomTextFromField(
                        keys: const PageStorageKey('phone'),
                        controller: phoneController,
                        hintText: 'Phone Number',
                        LabelText: 'Phone Number',
                        obscureText: false,
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15.h),

                      // CV Upload button
                      GestureDetector(
                        onTap: _handleUploadCV,
                        child: Container(
                          width: double.infinity,
                          height: 56.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.brightness == Brightness.dark
                                  ? colorScheme.onSurface.withOpacity(0.3)
                                  : AppColors.grayChateau,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upload your CV',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 16.sp,
                                  color: colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                              Icon(
                                Icons.upload_file,
                                color: AppColors.luxorGold,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Terms agreement
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value ?? false;
                        });
                      },
                      activeColor: AppColors.luxorGold,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 14.sp,
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                          children: [
                            const TextSpan(
                              text: 'By continuing you agree to the Bubbles ',
                            ),
                            TextSpan(
                              text: 'Term of Service',
                              style: TextStyle(
                                color: AppColors.luxorGold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: AppColors.luxorGold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Submit button
                GestureDetector(
                  onTap: _handleSubmit,
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C3A8C), // Blue button
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Become Affiliates',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
