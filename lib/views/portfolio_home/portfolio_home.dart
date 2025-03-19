import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/views/about/about_section.dart';
import 'package:portfolio_website/views/contact/contact_section.dart';
import 'package:portfolio_website/views/experiences/experience_section.dart';
import 'package:portfolio_website/views/home/home_section.dart';
import 'package:portfolio_website/views/projects/projects_section.dart';
import 'package:portfolio_website/views/skills/skills_section.dart';
import 'package:portfolio_website/views/testimonial/testimonial_section.dart';
import 'package:portfolio_website/widgets/footer/footer.dart';
import 'package:portfolio_website/widgets/painter/star_painter.dart';
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

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      if (_isDarkMode) {
        _themeAnimationController.forward();
      } else {
        _themeAnimationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Theme(
      data: _isDarkMode ? ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
          tertiary: const Color(0xFF43CBFF),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ) : ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6584),
          tertiary: const Color(0xFF43CBFF),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Mirza Mahmud Hossan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: _isDarkMode 
              ? Colors.black.withOpacity(0.7) 
              : Colors.white.withOpacity(0.7),
          scrolledUnderElevation: 0,
          elevation: 0,
          actions: [
            IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _themeAnimationController,
              ),
              onPressed: _toggleTheme,
            ),
            if (!isMobile) ..._buildNavItems(),
          ],
        ),
        drawer: isMobile ? _buildDrawer() : null,
        body: Stack(
          children: [
            if (!_isDarkMode) _buildLightBackground(),
            if (_isDarkMode) _buildDarkBackground(),
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
      ),
    );
  }

  Widget _buildLightBackground() {
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 300,
          left: -150,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          right: -100,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDarkBackground() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF121212),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: StarsPainter(),
          ),
        ),
      ],
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
            foregroundColor: MaterialStateProperty.all(
              _currentIndex == index 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).colorScheme.onSurface
            ),
            overlayColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary.withOpacity(0.1)
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

  Widget _buildDrawer() {
    final List<String> titles = [
      'Home', 'About', 'Experience', 'Skills', 'Projects', 'Testimonials', 'Contact'
    ];
    
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isDarkMode 
                ? [const Color(0xFF1A1A1A), const Color(0xFF0D0D0D)]
                : [Colors.white, Colors.grey.shade100],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=80&width=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mirza Mahmud Hossan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Mobile App Developer',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ...titles.asMap().entries.map((entry) {
              final int index = entry.key;
              final String title = entry.value;
              
              return ListTile(
                leading: Icon(
                  _getIconForSection(index),
                  color: _currentIndex == index 
                      ? Theme.of(context).colorScheme.primary 
                      : null,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                selected: _currentIndex == index,
                selectedColor: Theme.of(context).colorScheme.primary,
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(index);
                },
              );
            }).toList(),
            const Divider(),
            ListTile(
              leading: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _themeAnimationController,
              ),
              title: Text(_isDarkMode ? 'Light Mode' : 'Dark Mode'),
              onTap: () {
                Navigator.pop(context);
                _toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForSection(int index) {
    switch (index) {
      case 0: return Icons.home;
      case 1: return Icons.person;
      case 2: return Icons.work;
      case 3: return Icons.code;
      case 4: return Icons.apps;
      case 5: return Icons.star;
      case 6: return Icons.mail;
      default: return Icons.circle;
    }
  }
}

