import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  final List<Widget> navMenus;
  final VoidCallback onChangeTheme;

  const Header({required this.title, required this.navMenus, required this.onChangeTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ================================== left section ====================================
          Text(
            title,
            style: GoogleFonts.pacifico(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          // =================================== nav menu ========================================
          Row(
            spacing: 8,
            children: List.generate(navMenus.length, (index) => navMenus[index]),
          ),
          // ==================================== theme change ====================================
          IconButton(
            onPressed: onChangeTheme, 
            icon: FaIcon(FontAwesomeIcons.solidMoon, color: Colors.grey, size: 20)
          )
        ],
      ),
    );
  }
}