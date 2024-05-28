import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/common_button.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorFile.whiteColor,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: SizeFile.height16),
              TextFormField(
                  controller:
                      TextEditingController(text: StringConfig.adolCooper),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(SizeFile.height8)),
                    hintText: StringConfig.adolCooper,
                    hintStyle: const TextStyle(
                        fontSize: SizeFile.height14,
                        color: ColorFile.onBordingColor),
                  )),
              const SizedBox(height: SizeFile.height16),
              TextFormField(
                  controller: TextEditingController(
                      text: StringConfig.phone910000000000),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringConfig.thisFieldIsRequired;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(SizeFile.height8)),
                    hintText: StringConfig.phone910000000000,
                    hintStyle: const TextStyle(
                        fontSize: SizeFile.height14,
                        color: ColorFile.onBordingColor),
                  )),
              const SizedBox(height: SizeFile.height16),
              TextFormField(
                controller:
                    TextEditingController(text: StringConfig.exampleGmailCom),
                validator: (value) {
                  if (value!.isEmpty) {
                    return StringConfig.thisFieldIsRequired;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(SizeFile.height8)),
                  hintText: StringConfig.exampleGmailCom,
                  hintStyle: const TextStyle(
                      fontSize: SizeFile.height14,
                      color: ColorFile.onBordingColor),
                ),
              ),
              const SizedBox(height: SizeFile.height16),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  width: Get.width,
                  height: SizeFile.height52,
                  padding:
                      const EdgeInsets.symmetric(horizontal: SizeFile.height18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeFile.height8),
                      color: ColorFile.whiteColor,
                      border: Border.all(color: ColorFile.border)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              color: ColorFile.onBordingColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeFile.height14)),
                      Image.asset(
                        AssetImagePaths.dateOfBirthIcon,
                        color: ColorFile.orContinue,
                        height: SizeFile.height13,
                        width: SizeFile.height13,
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: ShortButton(
                      buttonColor: ColorFile.appColor.withOpacity(0.15),
                      textColor: ColorFile.onBordingColor,
                      text: StringConfig.cancel,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: ShortButton(
                      buttonColor: ColorFile.appColor,
                      textColor: ColorFile.whiteColor,
                      text: StringConfig.saveDetails,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeFile.height20)
            ])));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: ColorFile.whiteColor,
      elevation: 0,
      title: const Text(StringConfig.editProfile,
          style: TextStyle(
              decorationColor: ColorFile.onBordingColor,
              color: ColorFile.onBordingColor,
              fontFamily: satoshiBold,
              fontWeight: FontWeight.w400,
              fontSize: SizeFile.height22)),
      centerTitle: true,
      leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: SizeFile.height15,
              top: SizeFile.height20,
              bottom: SizeFile.height20,
            ),
            child: Image.asset(AssetImagePaths.backArrow2,
                height: SizeFile.height10,
                width: SizeFile.height18,
                color: ColorFile.onBordingColor),
          )),
    );
  }
}
