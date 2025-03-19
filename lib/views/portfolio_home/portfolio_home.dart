import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/models/home/home_navigation_model.dart';
import 'package:portfolio_website/views/about/about_section.dart';
import 'package:portfolio_website/views/contact/contact_section.dart';
import 'package:portfolio_website/views/experiences/experience_section.dart';
import 'package:portfolio_website/views/home/home_section.dart';
import 'package:portfolio_website/views/projects/projects_section.dart';
import 'package:portfolio_website/views/skills/skills_section.dart';
import 'package:portfolio_website/views/testimonial/testimonial_section.dart';
import 'package:portfolio_website/widgets/background/screen_bg_widget.dart';
import 'package:portfolio_website/widgets/footer/footer.dart';
import 'package:portfolio_website/widgets/header/header.dart';
import 'package:portfolio_website/widgets/navigation/navigation_item_widget.dart';
import 'package:portfolio_website/widgets/section/section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with TickerProviderStateMixin {

  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  bool _isDarkMode = false;
  late AnimationController _themeAnimationController;

  final List<HomeNavigationModel> navList = [
    HomeNavigationModel(navigatorTitle: "HOME", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "ABOUT", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "EXPERIENCE", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "SKILLS", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "PROJECTS", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "TESTIMONIALS", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "CONTACT", navigatorKey: GlobalKey()),
  ];
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateCurrentIndex);
    _themeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    
    // Schedule this for after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check system theme
      final brightness = MediaQuery.of(context).platformBrightness;
      setState(() {
        _isDarkMode = brightness == Brightness.dark;
        if (_isDarkMode) {
          _themeAnimationController.value = 1.0;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateCurrentIndex);
    _scrollController.dispose();
    _themeAnimationController.dispose();
    super.dispose();
  }

  void _updateCurrentIndex() {
    final double currentScroll = _scrollController.position.pixels;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    
    if (currentScroll <= 0) {
      setState(() => _currentIndex = 0);
      return;
    }
    
    if (currentScroll >= maxScroll) {
      setState(() => _currentIndex = navList.length - 1);
      return;
    }
    
    for (int i = 0; i < navList.length; i++) {
      if (navList[i].navigatorKey.currentContext == null) continue;
      
      final RenderBox renderBox = navList[i].navigatorKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      
      if (position.dy <= 100 && position.dy > -renderBox.size.height + 100) {
        if (_currentIndex != i) {
          setState(() => _currentIndex = i);
        }
        break;
      }
    }
  }

  void _scrollToSection(int index, BuildContext context) {
    if (navList[index].navigatorKey.currentContext == null) return;
    
    final RenderBox renderBox = navList[index].navigatorKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final offset = _scrollController.offset + position.dy - 80;
    
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: Header(
          title: 'Mirza Mahmud',
          navMenus: isMobile ? [] : navList.asMap().entries.map((entry) {
            final int index = entry.key;
            final String title = entry.value.navigatorTitle;

            return NavigationItemWidget(
              navList: navList, 
              onPressed: () => _scrollToSection(index, navList[index].navigatorKey.currentContext ?? context), 
              btnTxt: title,
              buttonStyle: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  _currentIndex == index 
                    ? Theme.of(context).colorScheme.primary 
                    : Theme.of(context).colorScheme.onSurface
                ),
                overlayColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary
                ),
              ),
              textStyle: GoogleFonts.nunito(
                fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
              ),
            );
          }).toList(),
          onChangeTheme: (){},
        )
      ),
      body: Stack(
        children: [
          // ======================================================= screen background =============================================
          ScreenBgWidget(),
          // ======================================================= scrollable section ============================================
          Scrollbar(
            thickness: 5,
            controller: _scrollController,
            trackVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  // =============================================== Home Section ==================================================
                  Section(
                    key: navList[0].navigatorKey,
                    child: HomeSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // =============================================== About Section =================================================
                  Section(
                    key: navList[1].navigatorKey,
                    child: AboutSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================ Experience Section ============================================
                  Section(
                    key: navList[2].navigatorKey,
                    child: ExperienceSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================= Skills Section ===============================================
                  Section(
                    key: navList[3].navigatorKey,
                    child: SkillsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================= Projects Section ==============================================
                  Section(
                    key: navList[4].navigatorKey,
                    child: ProjectsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================= Testimonials Section =================================================
                  Section(
                    key: navList[5].navigatorKey,
                    child: TestimonialsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================= Contact Section =================================================
                  Section(
                    key: navList[6].navigatorKey,
                    child: ContactSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // ================================================= Footer =================================================
                  Footer(isDarkMode: _isDarkMode),
                ],
              ),
            ),
          )
        ],
      ),
      // ===================================================== floating action =============================================================
      floatingActionButton: AnimatedOpacity(
        opacity: _scrollController.hasClients && _scrollController.offset > 300 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () => _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubic,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          child: const Icon(Icons.arrow_upward),
        ).animate(
          onPlay: (controller) => controller.repeat(),
        ).shimmer(
          delay: 3.seconds,
          duration: 1.8.seconds,
        ),
      ),
    );
  }
}