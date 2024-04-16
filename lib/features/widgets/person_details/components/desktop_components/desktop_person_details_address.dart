import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/features/models/person_model.dart';
import 'package:pdax_flutter_exam/config/constants.dart' as constants;
import 'package:pdax_flutter_exam/global/fields/custom_text_field.dart';

class DesktopPersonalDetailsAddress extends ConsumerWidget {
  const DesktopPersonalDetailsAddress({super.key, required this.person});

  final Datum person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Text Editing Controllers
    TextEditingController addressId = TextEditingController();
    TextEditingController streetCtrlr = TextEditingController();
    TextEditingController streetNameCtrlr = TextEditingController();
    TextEditingController bldgNoCtrlr = TextEditingController();
    TextEditingController cityCtrlr = TextEditingController();
    TextEditingController zipCodeCtrlr = TextEditingController();
    TextEditingController countryCtrlr = TextEditingController();
    TextEditingController countryCodeCtrlr = TextEditingController();
    TextEditingController latCtrlr = TextEditingController();
    TextEditingController longCtrlr = TextEditingController();

    //
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Address ID
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address ID',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: addressId..text = person.address!.id.toString(),
                    enabled: false,
                    hint: 'Address ID',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Street
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: streetCtrlr..text = person.address!.street!,
                    enabled: false,
                    hint: 'Street',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // =================== Row Street Name & Bldg Number =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Street Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street Name',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: streetNameCtrlr..text = person.address!.streetName!,
                    enabled: false,
                    hint: 'Address ID',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Bldg Number
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building No.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: bldgNoCtrlr..text = person.address!.buildingNumber!,
                    enabled: false,
                    hint: 'Building No.',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // =================== Row City & Zip =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // City
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: cityCtrlr..text = person.address!.city!,
                    enabled: false,
                    hint: 'City',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Zip Code
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zip Code',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: zipCodeCtrlr..text = person.address!.zipcode!,
                    enabled: false,
                    hint: 'Zip Code',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // =================== Row Country & Country Code =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Country
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: countryCtrlr..text = person.address!.country!,
                    enabled: false,
                    hint: 'Country',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Country Code
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country Code',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: countryCodeCtrlr..text = person.address!.countyCode!,
                    enabled: false,
                    hint: 'Country Code',
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),

        //
        const SizedBox(height: 24),

        // =================== Row Latitude & Longitude =================== //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Latitude
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latitude',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: latCtrlr
                      ..text = person.address!.latitude!.toString(),
                    enabled: false,
                    hint: 'Latitude',
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            //
            const SizedBox(width: 24),

            // Longitude
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Longitude',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: constants.mainText,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 6),

                  CustomTextField(
                    ctrlr: longCtrlr
                      ..text = person.address!.longitude!.toString(),
                    enabled: false,
                    hint: 'Longitude',
                    fontSize: 18,
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
