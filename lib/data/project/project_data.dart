import 'package:portfolio_website/models/project/project_model.dart';

class ProjectData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'E-Commerce App',
      description: 'A full-featured e-commerce mobile application with payment integration, user authentication, and product management.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'Firebase', 'Stripe'],
      liveUrl: 'https://example.com/ecommerce',
      githubUrl: 'https://github.com/example/ecommerce',
    ),
    ProjectModel(
      title: 'Food Delivery App',
      description: 'A food delivery application with real-time order tracking, restaurant listings, and payment processing.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'Google Maps', 'REST API'],
      liveUrl: 'https://example.com/fooddelivery',
      githubUrl: 'https://github.com/example/fooddelivery',
    ),
    ProjectModel(
      title: 'Fitness Tracker',
      description: 'A fitness tracking application that monitors workouts, nutrition, and provides personalized recommendations.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'HealthKit', 'Google Fit'],
      liveUrl: 'https://example.com/fitness',
      githubUrl: 'https://github.com/example/fitness',
    ),
    ProjectModel(
      title: 'Social Media App',
      description: 'A social media platform with features like posts, comments, likes, and user profiles.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions'],
      liveUrl: 'https://example.com/social',
      githubUrl: 'https://github.com/example/social',
    ),
    ProjectModel(
      title: 'Task Management App',
      description: 'A productivity app for managing tasks, projects, and deadlines with reminders and notifications.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'SQLite', 'Provider'],
      liveUrl: 'https://example.com/taskmanager',
      githubUrl: 'https://github.com/example/taskmanager',
    ),
    ProjectModel(
      title: 'Weather App',
      description: 'A weather forecasting application with location-based weather updates and interactive visualizations.',
      imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=200&width=400',
      technologies: ['Flutter', 'OpenWeather API', 'Animations'],
      liveUrl: 'https://example.com/weather',
      githubUrl: 'https://github.com/example/weather',
    ),
  ];
}