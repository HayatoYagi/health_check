import 'package:flutter/material.dart';
import 'package:health_check/ui/form/input_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InputViewModel(),
      child: const _InputPage(),
    );
  }
}

class _InputPage extends StatelessWidget {
  const _InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "入力フォーム",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const BodyTemperatureInput(),
          const SymptomInput(),
          ElevatedButton(
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
          // todo: 同意ボタン（チェックボックス）
          ElevatedButton(
            onPressed: () {
              context.read<InputViewModel>().submit();
            },
            child: const Text("送信"),
          ),
        ],
      ),
    );
  }
}

class BodyTemperatureInput extends StatelessWidget {
  const BodyTemperatureInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("体温"),
        Text(context
            .select((InputViewModel viewModel) => viewModel.bodyTemperature)
            .toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WheelChooser.integer(
              onValueChanged: (value) {
                context.read<InputViewModel>().bodyTemperatureIntegerPart =
                    value;
              },
              maxValue: 40,
              minValue: 35,
              listHeight: 100,
              listWidth: 50,
            ),
            const Text("."),
            WheelChooser.integer(
              onValueChanged: (value) {
                context.read<InputViewModel>().bodyTemperatureFractionalPart =
                    value;
              },
              maxValue: 9,
              minValue: 0,
              listHeight: 100,
              listWidth: 50,
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
    return Column(
      children: [
        const Text("自覚症状"),
        DropdownButton<String>(
          value: symptomsDescription[
              context.select((InputViewModel viewModel) => viewModel.symptom)
                  ? 1
                  : 0],
          items: const <String>["体温37.5未満で自覚症状なし", "自覚症状がある"]
              .map((String value) => DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String? value) {
            context.read<InputViewModel>().symptom =
                (symptomsDescription.indexOf(value ?? "") == 1) ? true : false;
          },
        ),
      ],
    );
  }
}
