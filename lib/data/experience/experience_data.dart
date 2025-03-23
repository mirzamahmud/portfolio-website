import 'package:portfolio_website/models/experience/experience_model.dart';

class ExperienceData {
  static final List<ExperienceModel> experienceList = [
    ExperienceModel(
      jobPeriod: 'Jul 2023 - Present', 
      designation: 'Flutter Developer', 
      companyName: 'Pakiza Software Limited', 
      jobDescription: "As a Flutter Mobile App Development team, I spearheaded the transformation of design specifications and wireframes into efficient, top-tier Flutter code. My focus on crafting reusable and dependable code underscored a commitment to performance and responsiveness. Collaborating closely with cross-functional teams, I validated requirements, designed solutions, and seamlessly implemented new features. My proactive approach involved identifying and resolving bottlenecks, addressing bugs, and ensuring a flawless user experience. Furthermore, my leadership extended to successfully deploying apps on both the App Store and Play Store, further solidifying our team's impact in the mobile application landscape."
    ),
    ExperienceModel(
      jobPeriod: 'Apr 2022 - Jun 2023', 
      designation: 'Jr. Flutter Developer', 
      companyName: 'THESOFTKING Limited', 
      jobDescription: "As a Junior Software Developer in a seasoned Software Development team, I adeptly translated Figma designs into efficient Flutter code, emphasizing reusable and reliable coding practices. Engaging with external data sources and APIs, I contributed to diverse projects, including Fintech, Crypto Wallet, and Service Apps. Collaborating across functions, I validated requirements, implemented new features, and ensured a cohesive user experience through meticulous app deployment."
    )
  ];
}