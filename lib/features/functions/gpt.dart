import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> encodeImage(String imagePath) async {
  final bytes = await File(imagePath).readAsBytes();
  return base64Encode(bytes);
}

Future<String> callGPT(String imagePath) async {
  // Path to your image

  String base64Image = await encodeImage(imagePath);

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
  if (response.statusCode != 200) {
    print("Request failed with status: ${response.statusCode}");
  }

  final result = jsonDecode(response.body)["choices"][0]["message"]["content"];
  print(result);
  return result;
}
