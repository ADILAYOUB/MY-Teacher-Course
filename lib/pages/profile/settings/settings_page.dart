import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/routes/names.dart';
import 'package:myteacher/common/values/constants.dart';
import 'package:myteacher/global.dart';
import 'package:myteacher/pages/app/bloc/app_blocs.dart';
import 'package:myteacher/pages/app/bloc/app_events.dart';
import 'package:myteacher/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:myteacher/pages/profile/settings/bloc/settings_state.dart';
import 'package:myteacher/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _removeUserData() {
    context.read<AppBlocs>().add(const TiggerEventApp(0));
    Global.storageService.logoOut(
      AppConstants.STORAGE_USER_TOKEN_KEY,
    );
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.SIGNIN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, _removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
