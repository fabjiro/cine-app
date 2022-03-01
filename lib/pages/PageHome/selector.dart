import 'package:cineapp/constantes.dart';
import 'package:cineapp/sharedPreferences.dart';
import 'package:cineapp/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SelectorCuidad extends StatefulWidget {
  const SelectorCuidad({
    Key? key,
  }) : super(key: key);

  @override
  _SelectorCuidadState createState() => _SelectorCuidadState();
}

class _SelectorCuidadState extends State<SelectorCuidad> {
  String hintText = "Seleccione una cuidad";
  @override
  void initState() {
    super.initState();
    if (PreferenceShared.pref!.containsKey('cuidad'))
      hintText = PreferenceShared.pref!.getString('cuidad')!;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<CustomThemeProvider>(context);
    return Container(
      width: 95.w,
      child: Card(
        color: themeProvider.theme.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingScreen,
            vertical: 3,
          ),
          child: DropdownButton(
            style: TextStyle(
              color: themeProvider.theme.textColor,
            ),
            underline: Container(),
            hint: Text(
              hintText,
              style: TextStyle(
                color: themeProvider.theme.textColor,
                fontSize: 14.sp,
              ),
            ),
            isExpanded: true,
            onChanged: (value) {
              setState(() => hintText = value.toString());
              PreferenceShared.pref!.setString('cuidad', value.toString());
            },
            items: listCuidad.map((String e) {
              return DropdownMenuItem(
                child: Text(e),
                value: e,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<String> listCuidad = ['Chinandega', 'Leon', 'Esteli', "Las Brisas"];
