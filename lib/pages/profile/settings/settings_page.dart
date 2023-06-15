import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning_app/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  /// Logout button
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm logout"),
                            content: const Text("Confirm logout"),
                            actions: [
                              TextButton(
                                onPressed: Navigator.of(context).pop(),
                                child: const Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 100.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/icons/Logout.png"),
                      )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
