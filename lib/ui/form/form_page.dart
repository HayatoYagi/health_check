import 'package:flutter/material.dart';
import 'package:health_check/ui/form/form_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormViewModel()..checkSubmitted(),
      child: const _FormPage(),
    );
  }
}

class _FormPage extends StatelessWidget {
  const _FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.select((FormViewModel viewModel) => viewModel.submitted)
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/check.png",
                        width: 160,
                        height: 160,
                      ),
                      const Text(
                        "送信されました",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "体温: ${context.select((FormViewModel viewModel) => viewModel.postedData!.bodytemp)}",
                            ),
                            Text(
                              "自覚症状: ${context.select((FormViewModel viewModel) => viewModel.postedData!.symptom ? "あり" : "なし")}",
                            ),
                            Text(
                              "提出時間: ${context.select((FormViewModel viewModel) => DateFormat('yyyy/MM/dd hh:mm').format(viewModel.postedData!.posttime))}",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<FormViewModel>().submitted = false;
                    },
                    child: const Text("再提出"),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("入力フォーム"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: BodyTemperatureInput(),
                  ),
                  // const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: SymptomInput(),
                  ),
                  // const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text("規約"),
                                    content: Text(
                                        "これは、学生自身の体調を管理するための健康観察チェックです。毎日、朝の検温と健康状態の確認をしたうえで、登校前までに必ず入力をお願いいたします。なお、いただいた情報は業務以外の目的には使用いたしません。"),
                                  );
                                });
                          },
                          child: const Text("規約はこちら"),
                        ),
                        SwitchListTile(
                          title: const Text("上記個人情報の提供について同意し回答します"),
                          value: context.select((FormViewModel viewModel) =>
                              viewModel.rulesAgreed),
                          onChanged: (value) {
                            context.read<FormViewModel>().rulesAgreed = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (context.select((FormViewModel viewModel) =>
                                viewModel.rulesAgreed))
                            ? () {
                                context.read<FormViewModel>().submit();
                              }
                            : null,
                        child: const Text("送信"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class BodyTemperatureInput extends StatelessWidget {
  const BodyTemperatureInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "体温",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // Text(context
        //     .select((InputViewModel viewModel) => viewModel.bodyTemperature)
        //     .toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WheelChooser.integer(
              onValueChanged: (value) {
                context.read<FormViewModel>().bodyTemperatureIntegerPart =
                    value;
              },
              maxValue: 40,
              minValue: 35,
              initValue:
                  context.read<FormViewModel>().bodyTemperatureIntegerPart,
              listHeight: 100,
              listWidth: 50,
              unSelectTextStyle: const TextStyle(color: Colors.grey),
            ),
            const Text("."),
            WheelChooser.integer(
              onValueChanged: (value) {
                context.read<FormViewModel>().bodyTemperatureFractionalPart =
                    value;
              },
              maxValue: 9,
              minValue: 0,
              initValue:
                  context.read<FormViewModel>().bodyTemperatureFractionalPart,
              listHeight: 100,
              listWidth: 50,
              unSelectTextStyle: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class SymptomInput extends StatelessWidget {
  const SymptomInput({Key? key}) : super(key: key);

  final List<String> symptomsDescription = const ["体温37.5未満で自覚症状なし", "自覚症状がある"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "自覚症状",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Center(
            child: DropdownButton<String>(
              value: symptomsDescription[
                  context.select((FormViewModel viewModel) => viewModel.symptom)
                      ? 1
                      : 0],
              items: const <String>["体温37.5未満で自覚症状なし", "自覚症状がある"]
                  .map((String value) => DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String? value) {
                context.read<FormViewModel>().symptom =
                    (symptomsDescription.indexOf(value ?? "") == 1)
                        ? true
                        : false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
