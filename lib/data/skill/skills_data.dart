import 'package:flutter/material.dart';
import 'package:portfolio_website/models/skill/skills_model.dart';

class SkillsData {

  static List<SkillSModel> skills = [
    SkillSModel('Flutter', 0.9, Colors.blue),
    SkillSModel('Dart', 0.9, Colors.teal),
    SkillSModel('React Native', 0.7, Colors.purple),
    SkillSModel('Android (Java/Kotlin)', 0.6, Colors.green),
    SkillSModel('iOS (Swift)', 0.5, Colors.orange),
    SkillSModel('UI Design', 0.8, Colors.pink),
    SkillSModel('Animations', 0.85, Colors.amber),
    SkillSModel('Responsive Design', 0.9, Colors.indigo),
    SkillSModel('Figma', 0.7, Colors.red),
    SkillSModel('Adobe XD', 0.6, Colors.deepPurple),
    SkillSModel('Firebase', 0.85, Colors.amber),
    SkillSModel('RESTful APIs', 0.8, Colors.blue),
    SkillSModel('GraphQL', 0.6, Colors.pink),
    SkillSModel('Git & GitHub', 0.85, Colors.black),
    SkillSModel('CI/CD', 0.7, Colors.teal),
  ];
}
