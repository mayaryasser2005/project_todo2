import 'package:flutter/material.dart';
import 'package:project_todo2/utils/assets_color.dart';

class SettingsTab extends StatelessWidget {
  static const String routeNamed = "SettingTad";

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = "en";
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(flex: 7, child: Container(color: const Color(0xFF5C9BEA))),
          Expanded(
            flex: 88,
            child: Stack(
              children: [
                Container(color: AppColors.bgColor),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Language",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      DropdownButton<String>(
                        value: selectedLanguage,
                        items: const [
                          DropdownMenuItem(
                            value: "en",
                            child: Text("English"),
                          ),
                          DropdownMenuItem(
                            value: "ar",
                            child: Text("العربيه"),
                          ),
                        ],
                        isExpanded: true,
                        onChanged: (newValue) {
                          selectedLanguage = newValue!;
                        },
                      ),
                      SizedBox(height: 15),
                      const Text(
                        "Theme",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        focusColor: Colors.white,
                        value: selectedLanguage,
                        items: const [
                          DropdownMenuItem(
                            value: "en",
                            child: Text("light"),
                          ),
                          DropdownMenuItem(
                            value: "ar",
                            child: Text("Dark"),
                          ),
                        ],
                        isExpanded: true,
                        onChanged: (newValue) {
                          selectedLanguage = newValue!;
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    Column(
      children: [
        Expanded(flex: 12, child: Container(color: const Color(0xFF5C9BEA))),
        Expanded(
          flex: 88,
          child: Stack(
            children: [
              Container(color: AppColors.bgColor),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Language",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      value: selectedLanguage,
                      items: const [
                        DropdownMenuItem(
                          value: "en",
                          child: Text("English"),
                        ),
                        DropdownMenuItem(
                          value: "ar",
                          child: Text("العربيه"),
                        ),
                      ],
                      isExpanded: true,
                      onChanged: (newValue) {
                        selectedLanguage = newValue!;
                      },
                    ),
                    SizedBox(height: 15),
                    const Text(
                      "Theme",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: selectedLanguage,
                      items: const [
                        DropdownMenuItem(
                          value: "en",
                          child: Text("light"),
                        ),
                        DropdownMenuItem(
                          value: "ar",
                          child: Text("Dark"),
                        ),
                      ],
                      isExpanded: true,
                      onChanged: (newValue) {
                        selectedLanguage = newValue!;
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
