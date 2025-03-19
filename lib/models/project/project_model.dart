class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? liveUrl;
  final String? githubUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.liveUrl,
    this.githubUrl,
  });
}