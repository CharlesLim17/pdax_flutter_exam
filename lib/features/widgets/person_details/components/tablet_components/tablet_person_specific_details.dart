import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/global/fields/custom_text_field.dart';

class TabletPersonSpecificDetails extends ConsumerWidget {
  const TabletPersonSpecificDetails({super.key, required this.person});

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

    String formattedBdate =
        DateFormat('MMMM dd, yyyy').format(person.birthday!);

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
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: firstNameCtrlr..text = person.firstname!,
                    enabled: false,
                    hint: 'First Name',
                    fontSize: 16,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 16),

            // Last Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: lastNameCtrlr..text = person.lastname!,
                    enabled: false,
                    hint: 'Last Name',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 16),

        // Email
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: constants.mainText,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),

        //
        const SizedBox(height: 4),

        CustomTextField(
          ctrlr: emailCtrlr..text = person.email!,
          enabled: false,
          hint: 'Email',
          fontSize: 16,
        ),

        //
        const SizedBox(height: 16),

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
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: phoneCtrlr..text = person.phone!,
                    enabled: false,
                    hint: 'Phone',
                    fontSize: 16,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 16),

            // Birthday
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Birthday',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: birthdayCtrlr..text = formattedBdate,
                    enabled: false,
                    hint: 'Birthday',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 16),

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
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: genderCtrlr..text = person.gender!.toUpperCase(),
                    enabled: false,
                    hint: 'Gender',
                    fontSize: 16,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 16),

            // Website
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Website',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 4),

                  CustomTextField(
                    ctrlr: websisteCtlr..text = person.website!,
                    enabled: false,
                    hint: 'Website',
                    fontSize: 16,
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
