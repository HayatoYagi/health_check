import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_check/ui/edit_profile/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel()..loadUserData(),
      child: const _EditProfileWidget(),
    );
  }
}

class _EditProfileWidget extends StatelessWidget {
  const _EditProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール設定"),
      ),
      body: ((context.select(
                  (EditProfileViewModel viewModel) => viewModel.userData)) ==
              null)
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: context
                                .read<EditProfileViewModel>()
                                .userData
                                ?.lastname,
                            decoration: const InputDecoration(
                              labelText: "姓",
                            ),
                            onChanged: (String value) {
                              context.read<EditProfileViewModel>().userData =
                                  context
                                      .read<EditProfileViewModel>()
                                      .userData
                                      ?.copyWith(lastname: value);
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: context
                                .read<EditProfileViewModel>()
                                .userData
                                ?.firstname,
                            decoration: const InputDecoration(
                              labelText: "名",
                            ),
                            onChanged: (String value) {
                              context.read<EditProfileViewModel>().userData =
                                  context
                                      .read<EditProfileViewModel>()
                                      .userData
                                      ?.copyWith(firstname: value);
                            },
                          ),
                        ),
                      ],
                    ),
                    DropdownButtonFormField(
                      value: context.select((EditProfileViewModel viewModel) =>
                          viewModel.userData?.grade),
                      items: [1, 2, 3, 4]
                          .map((int value) => DropdownMenuItem(
                                value: value,
                                child: Text("第$value学年"),
                              ))
                          .toList(),
                      onChanged: (int? value) {
                        context.read<EditProfileViewModel>().userData = context
                            .read<EditProfileViewModel>()
                            .userData
                            ?.copyWith(grade: value!);
                      },
                      decoration: const InputDecoration(
                        labelText: "学年",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      initialValue: context
                          .read<EditProfileViewModel>()
                          .userData
                          ?.schoolid
                          .toString(),
                      decoration: const InputDecoration(
                        labelText: "学籍番号",
                      ),
                      onChanged: (String value) {
                        context.read<EditProfileViewModel>().userData = context
                            .read<EditProfileViewModel>()
                            .userData
                            ?.copyWith(schoolid: int.parse(value));
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      initialValue: context
                          .read<EditProfileViewModel>()
                          .userData
                          ?.studentid
                          .toString(),
                      decoration: const InputDecoration(
                        labelText: "学生番号",
                      ),
                      onChanged: (String value) {
                        context.read<EditProfileViewModel>().userData = context
                            .read<EditProfileViewModel>()
                            .userData
                            ?.copyWith(studentid: int.parse(value));
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      initialValue: context
                          .read<EditProfileViewModel>()
                          .userData
                          ?.normalbodytemp
                          .toStringAsFixed(1),
                      decoration: const InputDecoration(
                        labelText: "平熱",
                      ),
                      onChanged: (String value) {
                        context.read<EditProfileViewModel>().userData = context
                            .read<EditProfileViewModel>()
                            .userData
                            ?.copyWith(
                                normalbodytemp: double.parse(
                                    value)); // todo: 今のままでは"36.5.6,"のような入力もできてしまう
                      },
                    ),
                    DropdownButtonFormField(
                      value: context.select((EditProfileViewModel viewModel) =>
                          viewModel.userData?.gender),
                      // todo: これが["男性", "女性", "その他"]に含まれていないとエラー
                      items: ["男性", "女性", "その他"]
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        context.read<EditProfileViewModel>().userData = context
                            .read<EditProfileViewModel>()
                            .userData
                            ?.copyWith(gender: value!);
                      },
                      decoration: const InputDecoration(
                        labelText: "性別",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<EditProfileViewModel>().saveUserData();
                        },
                        child: const Text("保存"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
