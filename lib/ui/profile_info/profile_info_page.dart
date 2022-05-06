import 'package:flutter/material.dart';
import 'package:health_check/ui/profile_info/profile_info_view_model.dart';
import 'package:provider/provider.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileInfoViewModel()
        ..loadUserData()
        ..authenticate(),
      child: _ProfileInfoPage(),
    );
  }
}

class _ProfileInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登録情報"),
      ),
      body: context.select((ProfileInfoViewModel viewModel) =>
              viewModel.userData == null || !viewModel.didAuthenticate)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("パスワードで保護されています"),
                  TextButton(
                    onPressed: () {
                      context.read<ProfileInfoViewModel>().authenticate();
                    },
                    child: const Text("表示"),
                  ),
                ],
              ),
            )
          : Scrollbar(
              thickness: 6,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ProfileInfoItem(
                      title: "氏名",
                      content:
                          "${context.select((ProfileInfoViewModel viewModel) => viewModel.userData!.lastname)} ${context.select((ProfileInfoViewModel viewModel) => viewModel.userData!.firstname)}",
                    ),
                    _ProfileInfoItem(
                      title: "メールアドレス",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) =>
                              viewModel.userData!.mail),
                    ),
                    _ProfileInfoItem(
                      title: "平熱",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) => viewModel
                              .userData!.normalbodytemp
                              .toStringAsFixed(1)),
                    ),
                    _ProfileInfoItem(
                      title: "性別",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) =>
                              viewModel.userData!.gender),
                    ),
                    _ProfileInfoItem(
                      title: "学籍番号",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) =>
                              viewModel.userData!.schoolid.toString()),
                    ),
                    _ProfileInfoItem(
                      title: "学生番号",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) =>
                              viewModel.userData!.studentid.toString()),
                    ),
                    _ProfileInfoItem(
                      title: "学年",
                      content: context.select(
                          (ProfileInfoViewModel viewModel) =>
                              viewModel.userData!.grade.toString()),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  _ProfileInfoItem({required this.title, required this.content});

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Text(title),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
