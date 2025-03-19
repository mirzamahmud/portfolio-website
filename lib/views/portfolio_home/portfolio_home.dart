import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import 'package:portfolio_website/widgets/section/section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with TickerProviderStateMixin {
  
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(7, (_) => GlobalKey());
  int _currentIndex = 0;
  bool _isDarkMode = false;
  late AnimationController _themeAnimationController;
  
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
      setState(() => _currentIndex = _sectionKeys.length - 1);
      return;
    }
    
    for (int i = 0; i < _sectionKeys.length; i++) {
      if (_sectionKeys[i].currentContext == null) continue;
      
      final RenderBox renderBox = _sectionKeys[i].currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      
      if (position.dy <= 100 && position.dy > -renderBox.size.height + 100) {
        if (_currentIndex != i) {
          setState(() => _currentIndex = i);
        }
        break;
      }
    }
  }

  void _scrollToSection(int index) {
    if (_sectionKeys[index].currentContext == null) return;
    
    final RenderBox renderBox = _sectionKeys[index].currentContext!.findRenderObject() as RenderBox;
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
          navMenus: !isMobile ? _buildNavItems() : [],
          onChangeTheme: (){},
        )
      ),
      body: Stack(
        children: [
          // ======================================================= screen background =============================================
          ScreenBgWidget(),
          // ======================================================= scrollable section ============================================
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  // Home Section
                  Section(
                    key: _sectionKeys[0],
                    child: HomeSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // About Section
                  Section(
                    key: _sectionKeys[1],
                    child: AboutSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Experience Section
                  Section(
                    key: _sectionKeys[2],
                    child: ExperienceSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Skills Section
                  Section(
                    key: _sectionKeys[3],
                    child: SkillsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Projects Section
                  Section(
                    key: _sectionKeys[4],
                    child: ProjectsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Testimonials Section
                  Section(
                    key: _sectionKeys[5],
                    child: TestimonialsSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Contact Section
                  Section(
                    key: _sectionKeys[6],
                    child: ContactSection(isDarkMode: _isDarkMode),
                  ),
                  
                  // Footer
                  Footer(isDarkMode: _isDarkMode),
                ]),
              ),
            ],
          ),
        ],
      ),
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

  List<Widget> _buildNavItems() {
    final List<String> titles = [
      'Home', 'About', 'Experience', 'Skills', 'Projects', 'Testimonials', 'Contact'
    ];
    
    return titles.asMap().entries.map((entry) {
      final int index = entry.key;
      final String title = entry.value;
      
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton(
          onPressed: () => _scrollToSection(index),
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              _currentIndex == index 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).colorScheme.onSurface
            ),
            overlayColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primary
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    }).toList();
  }
}

