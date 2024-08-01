

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unavialable/features/functions/calculate.dart';
import 'package:unavialable/features/functions/gpt.dart';
import 'package:unavialable/features/functions/string_manupulation.dart';
import 'package:unavialable/presentation/provider/provider.dart';
import 'package:unavialable/presentation/widget/alert_dialog.dart';




Future<void> callApiFromGallery(BuildContext context) async {
//====================== Rasmni tanlab olish ======================
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) {
    print('No image selected.');
    return;
  }

  File selectedImage = File(pickedFile.path);
  print("Tanlangan rasm manzili: $selectedImage");

  String base64Image = await encodeImage(selectedImage.path);

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey",
  };

  Map<String, dynamic> payload = {
    "model": "gpt-4-turbo-2024-04-09",
    "messages": [
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text":
                "answer me in the following format:{total_calories: cal, total_protein: pr, total_fat: ft, total_carbohydrate: crb}"
          },
          {
            "type": "image_url",
            "image_url": {"url": "data:image/jpeg;base64,$base64Image"}
          }
        ]
      }
    ],
    "max_tokens": 300
  };

  final response = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: headers,
    body: jsonEncode(payload),
  );

//====================== API dan qaytgan qiymatni olish ======================
  if (response.statusCode == 200) {
    final result =
        jsonDecode(response.body)["choices"][0]["message"]["content"];
    Map<String, dynamic> responseData = stringToMap(result);

    if (responseData["error"] == "error") {
      // Provider.of<ProviderClass>(context, listen: false).isToastenable(false);
      showToast(
        MediaQuery.sizeOf(context).width * 0.04,
      );
    } else {
      try {
        String _calory =
            "${responseData["total_calories"]}/${responseData["total_fat"]}/${responseData["total_protein"]}/${responseData["total_carbohydrate"]}";
        print("GPT ishlayabdi!!!!!!!!!!!!!!!!!!");
// ******** Bu Apiga ma'lumot yuborilgan VAQT ********
        final now = DateTime.now();
        String formattedDate = DateFormat('dd-MM-yyyy').format(now);
        String formattedDay = DateFormat('dd').format(now);
        String formattedTime = DateFormat('HH:mm').format(now);
        String dateTime = "$formattedDate 🕘$formattedTime";

//=================================================================
        await saveApiDataMemory(
          selectedImage.path,
          _calory,
          dateTime,
          formattedDay,
          context,
        );

        calculateCaloriesDecrease(context);

//=================== Qiymatlarni init qilish ===================
        Provider.of<ProviderClass>(context, listen: false).initSavedText(
          selectedImage.path,
          _calory,
          dateTime,
          formattedDay,
        );

        print("Caloryalar: $_calory");
        print("Kunning ko'rinishi $formattedDay");

// ******** API dan kelgan ma'lumotlarni hisob-kitob qilish  ********
      } catch (e) {
        print("Ma'lumotlarni saqlashda qandaydir xato\n Eror:$e");
      }
    }
  } else {
    print('Failed to upload image: ${response.statusCode}');
  }
}

Future<void> callApiFromCamera(BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile == null) {
    print('No image selected.');
    return;
  }

  File selectedImage = File(pickedFile.path);
  print("Tanlangan rasm manzili: $selectedImage");

  String base64Image = await encodeImage(selectedImage.path);

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey",
  };

  Map<String, dynamic> payload = {
    "model": "gpt-4-turbo-2024-04-09",
    "messages": [
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text":
                "answer me in the following format:{total_calories: cal, total_protein: pr, total_fat: ft, total_carbohydrate: crb}"
          },
          {
            "type": "image_url",
            "image_url": {"url": "data:image/jpeg;base64,$base64Image"}
          }
        ]
      }
    ],
    "max_tokens": 300
  };

  final response = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: headers,
    body: jsonEncode(payload),
  );

//====================== API dan qaytgan qiymatni olish ======================
  if (response.statusCode == 200) {
    final result =
        jsonDecode(response.body)["choices"][0]["message"]["content"];
    Map<String, dynamic> responseData = stringToMap(result);

    if (responseData["error"] == "error") {
      // Provider.of<ProviderClass>(context, listen: false).isToastenable(false);
      showToast(
        MediaQuery.sizeOf(context).width * 0.04,
      );
    } else {
      try {
// ******** Bu apidan kelayotgan kaloriyalar ********
        String _calory =
            "${responseData["total_calories"]}/${responseData["total_fat"]}/${responseData["total_protein"]}/${responseData["total_carbohydrate"]}";
        print("GPT ishlayabdi!!!!!!!!!!!!!!!!!!");
// ******** Bu Apiga ma'lumot yuborilgan VAQT ********
        final now = DateTime.now();
        String formattedDate = DateFormat('dd-MM-yyyy').format(now);
        String formattedDay = DateFormat('dd').format(now);
        String formattedTime = DateFormat('HH:mm').format(now);
        String dateTime = "$formattedDate 🕘$formattedTime";

//=================================================================
        await saveApiDataMemory(
          selectedImage.path,
          _calory,
          dateTime,
          formattedDay,
          context,
        );

        calculateCaloriesDecrease(context);

//=================== Qiymatlarni init qilish ===================
        Provider.of<ProviderClass>(context, listen: false).initSavedText(
          selectedImage.path,
          _calory,
          dateTime,
          formattedDay,
        );

        print("Caloryalar: $_calory");
        print("Kunning ko'rinishi $formattedDay");

// ******** API dan kelgan ma'lumotlarni hisob-kitob qilish  ********
      } catch (e) {
        print("Ma'lumotlarni saqlashda qandaydir xato\n Eror:$e");
      }
    }
  } else {
    print('Failed to upload image: ${response.statusCode}');
  }
}

/*
API dan o'zgarmas
 "{total_calories: 600 cal, total_protein: 40 pr, total_fat: 35 ft, total_carbohydrate: 20 crb} 
Please note these values are estimates and can vary based on the specific ingredients and serving size." 
ko'rinishidagi String xabar keladi. Sen shu xabarni menga 
{
    "total_calories" : 600,
    "total_protein" : 40,
    "total_fat" : 35,
    "total_carbohydrate" : 20
}
Map<String, int> ko'rinishida qilib bera oladigan funksiya yozib ber.
 */