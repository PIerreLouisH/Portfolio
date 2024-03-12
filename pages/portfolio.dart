import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  final List<Project> projects = [
    Project(
      name: 'Project 1',
      description: 'Description of Project 1.',
      githubUrl: 'https://github.com/yourusername/project1',
    ),
    Project(
      name: 'Project 2',
      description: 'Description of Project 2.',
      githubUrl: 'https://github.com/yourusername/project2',
    ),
    // Add more projects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio - Projects'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }
}

class Project {
  final String name;
  final String description;
  final String githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.githubUrl,
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              project.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                launch(project.githubUrl); // Make sure to import 'package:url_launcher/url_launcher.dart';
              },
              icon: Icon(Icons.link),
              label: Text('View on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
