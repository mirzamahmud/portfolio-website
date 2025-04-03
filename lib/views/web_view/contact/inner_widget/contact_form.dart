import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/views/web_view/contact/controller/contact_section_controller.dart';
import 'package:portfolio_website/widgets/button/custom_elevated_button.dart';
import 'package:portfolio_website/widgets/button/custom_loading_button.dart';
import 'package:portfolio_website/widgets/text_field/custom_text_field.dart';

class ContactForm extends StatelessWidget {
  final ContactSectionController controller;
  const ContactForm({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: BLACK_COLOR.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: PRIMARY_COLOR, width: 1),
      ),
      child: Form(
        key: controller.contactFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                  "Send Me a Message",
                  style: AppTextStyle.titleLarge.copyWith(color: WHITE_COLOR),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 100.ms)
                .slideY(begin: 0.2, end: 0),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: 'Name',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    textController: controller.nameController,
                    textFocusNode: controller.nameFocusNode,
                    hintText: 'Enter your name',

                    delay: 200,
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: CustomTextField(
                    labelText: 'Email',
                    textController: controller.emailController,
                    textFocusNode: controller.emailFocusNode,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter your email',

                    delay: 300,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            CustomTextField(
              labelText: 'Subject',
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
              textController: controller.subjectController,
              textFocusNode: controller.subjectFocusNode,
              hintText: 'Enter your subject of the message',
              delay: 400,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              labelText: 'Message',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              textController: controller.messageController,
              textFocusNode: controller.messageFocusNode,
              hintText: 'Enter your message',
              maxLines: 4,
              delay: 500,
            ),
            20.verticalSpace,
            Obx(
              () =>
                  controller.isSubmit.value
                      ? CustomLoadingButton()
                      : CustomElevatedButton(
                            onPressed: () => controller.submitForm(),
                            title: 'Submit',
                          )
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 600.ms)
                          .scale(
                            begin: const Offset(0.9, 0.9),
                            end: const Offset(1, 1),
                          ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 800.ms);
  }
}
