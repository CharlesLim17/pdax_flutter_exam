import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/global/fields/custom_text_field.dart';

class DesktopPersonSpecificDetails extends ConsumerWidget {
  const DesktopPersonSpecificDetails({super.key, required this.person});

  final Datum person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Text Editing Controllers
    TextEditingController firstNameCtrlr = TextEditingController();
    TextEditingController lastNameCtrlr = TextEditingController();
    TextEditingController emailCtrlr = TextEditingController();
    TextEditingController phoneCtrlr = TextEditingController();
    TextEditingController birthdayCtrlr = TextEditingController();
    TextEditingController genderCtrlr = TextEditingController();
    TextEditingController websisteCtlr = TextEditingController();

    //
    return Column(
      children: [
        // =================== Row First & Last Name=================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // First Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: firstNameCtrlr..text = person.firstname!,
                    enabled: false,
                    hint: 'First Name',
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Last Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: lastNameCtrlr..text = person.lastname!,
                    enabled: false,
                    hint: 'Last Name',
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // Email
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: constants.mainText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),

        //
        const SizedBox(height: 6),

        CustomTextField(
          ctrlr: emailCtrlr..text = person.email!,
          enabled: false,
          hint: 'Email',
        ),

        //
        const SizedBox(height: 24),

        // =================== Row Phone & Birthday =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Phone
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: phoneCtrlr..text = person.phone!,
                    enabled: false,
                    hint: 'Phone',
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Birthday
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Birthday',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: birthdayCtrlr..text = person.birthday!.toString(),
                    enabled: false,
                    hint: 'Birthday',
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // =================== Row Gender & Website =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Gender
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: genderCtrlr..text = person.gender!.toUpperCase(),
                    enabled: false,
                    hint: 'Gender',
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Website
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Website',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: websisteCtlr..text = person.website!,
                    enabled: false,
                    hint: 'Website',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
