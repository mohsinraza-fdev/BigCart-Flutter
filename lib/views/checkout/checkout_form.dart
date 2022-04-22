import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';
import '../../viewmodels/checkout_viewmodel.dart';
import '../../widgets/dumb/authentication_field.dart';
import 'validation_message.dart';

class CheckoutForm extends HookViewModelWidget<CheckoutViewModel> {
  const CheckoutForm({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
      BuildContext context, CheckoutViewModel viewModel) {
    TextEditingController name = useTextEditingController();
    FocusNode nameFocus = useFocusNode();
    TextEditingController email = useTextEditingController();
    FocusNode emailFocus = useFocusNode();
    TextEditingController phone = useTextEditingController();
    FocusNode phoneFocus = useFocusNode();
    TextEditingController address = useTextEditingController();
    FocusNode addressFocus = useFocusNode();
    TextEditingController zipcode = useTextEditingController();
    FocusNode zipcodeFocus = useFocusNode();
    TextEditingController city = useTextEditingController();
    FocusNode cityFocus = useFocusNode();
    FocusNode countryFocus = useFocusNode();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 29),

          // Name Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: name,
                focusNode: nameFocus,
                hasError: viewModel.formNameHasError,
                onChanged: (text) {
                  viewModel.formName = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'Name',
                prefixIconPath: AssetConstants.nameIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.nameIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formNameHasError,
                errorMessage: viewModel.formNameError,
              ),
            ],
          ),

          // Email Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: email,
                focusNode: emailFocus,
                hasError: viewModel.formEmailHasError,
                onChanged: (text) {
                  viewModel.formEmail = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'Email',
                prefixIconPath: AssetConstants.emailIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.emailIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formEmailHasError,
                errorMessage: viewModel.formEmailError,
              ),
            ],
          ),

          // Phone Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: phone,
                focusNode: phoneFocus,
                hasError: viewModel.formPhoneHasError,
                onChanged: (text) {
                  viewModel.formPhone = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'Phone',
                prefixIconPath: AssetConstants.phoneIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.phoneIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formPhoneHasError,
                errorMessage: viewModel.formPhoneError,
              ),
            ],
          ),

          // Address Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: address,
                focusNode: addressFocus,
                hasError: viewModel.formAddressHasError,
                onChanged: (text) {
                  viewModel.formAddress = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'Address',
                prefixIconPath: AssetConstants.addressIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.addressIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formAddressHasError,
                errorMessage: viewModel.formAddressError,
              ),
            ],
          ),

          // ZipCode Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: zipcode,
                focusNode: zipcodeFocus,
                hasError: viewModel.formZipcodeHasError,
                onChanged: (text) {
                  viewModel.formZipcode = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'Zip code',
                prefixIconPath: AssetConstants.zipcodeIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.zipcodeIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formZipcodeHasError,
                errorMessage: viewModel.formZipcodeError,
              ),
            ],
          ),

          // City Field
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthenticationField(
                controller: city,
                focusNode: cityFocus,
                hasError: viewModel.formCityHasError,
                onChanged: (text) {
                  viewModel.formCity = text;
                },
                onSubmit: (text) {},
                textColor: appGreyColor,
                onTap: () {},
                onEditingComplete: () {},
                label: 'City',
                prefixIconPath: AssetConstants.cityIcon,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 60,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetConstants.cityIcon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              ValidationMessage(
                hasError: viewModel.formCityHasError,
                errorMessage: viewModel.formCityError,
              ),
            ],
          ),

          // Country Dropdown Box
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(
                        milliseconds:
                            viewModel.formCountryHasError == true ? 300 : 200),
                    alignment: Alignment.center,
                    height: 62,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: viewModel.formCountryHasError == true
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 62),
                        child: Text(
                          'Country',
                          style:
                              heading3.copyWith(letterSpacing: 15 * (3 / 100)),
                        ),
                      ),
                      isExpanded: true,
                      focusNode: countryFocus,
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 62),
                            child: Text(
                              'United States',
                              style: heading3.copyWith(
                                letterSpacing: 15 * (3 / 100),
                                color: appGreyColor,
                              ),
                            ),
                          ),
                          value: 'united states',
                        ),
                        DropdownMenuItem(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 62),
                            child: Text(
                              'Pakistan',
                              style: heading3.copyWith(
                                letterSpacing: 15 * (3 / 100),
                                color: appGreyColor,
                              ),
                            ),
                          ),
                          value: 'pakistan',
                        ),
                      ],
                      onChanged: (text) {
                        viewModel.formCountry = text.toString();
                      },
                      icon: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        width: 37,
                        child: Image.asset(AssetConstants.dropdownIcon),
                      ),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 18),
                      width: 60,
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetConstants.countryIcon,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                ],
              ),
              ValidationMessage(
                hasError: viewModel.formCountryHasError,
                errorMessage: viewModel.formCountryError,
              ),
            ],
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }
}
