import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final String programId;

  const ProgramDetailsScreen({
    super.key,
    required this.programId,
  });

  Map<String, dynamic> _getProgramDetails(String id) {
    final programs = {
      'data_analytics': {
        'title': 'Data Analytics Pathway',
        'description': 'Master data analysis skills with hands-on projects and real-world applications. Learn Excel, SQL, Python, and Power BI to become a proficient data analyst.',
        'duration': '5 months',
        'modules': [
          {
            'title': 'Excel Fundamentals',
            'description': 'Learn advanced Excel functions and data manipulation',
            'duration': '2 weeks',
            'completed': false,
          },
          {
            'title': 'SQL Database Management',
            'description': 'Master SQL queries and database design principles',
            'duration': '3 weeks',
            'completed': false,
          },
          {
            'title': 'Python for Data Analysis',
            'description': 'Learn Python programming for data science',
            'duration': '4 weeks',
            'completed': false,
          },
        ],
        'milestones': [
          'Complete Excel certification',
          'Build a SQL database project',
          'Create a Python data analysis project',
          'Design a Power BI dashboard',
        ],
        'badges': [
          'Excel Expert',
          'SQL Master',
          'Python Analyst',
          'Data Visualization Pro',
        ],
      },
      'ux_design': {
        'title': 'UX Design Pathway',
        'description': 'Learn user experience design principles, wireframing, prototyping, and user research to create intuitive digital experiences.',
        'duration': '6 months',
        'modules': [
          {
            'title': 'Design Thinking Fundamentals',
            'description': 'Learn the design thinking process and methodology',
            'duration': '2 weeks',
            'completed': false,
          },
          {
            'title': 'User Research & Personas',
            'description': 'Master user research techniques and persona creation',
            'duration': '3 weeks',
            'completed': false,
          },
          {
            'title': 'Wireframing & Prototyping',
            'description': 'Create wireframes and interactive prototypes',
            'duration': '4 weeks',
            'completed': false,
          },
        ],
        'milestones': [
          'Complete user research project',
          'Design a mobile app wireframe',
          'Create interactive prototype',
          'Conduct usability testing',
        ],
        'badges': [
          'Design Thinker',
          'User Researcher',
          'Wireframe Expert',
          'Prototype Master',
        ],
      },
      'digital_marketing': {
        'title': 'Digital Marketing Pathway',
        'description': 'Master digital marketing strategies, social media marketing, SEO, and analytics to drive business growth.',
        'duration': '4 months',
        'modules': [
          {
            'title': 'Digital Marketing Fundamentals',
            'description': 'Learn core digital marketing concepts and strategies',
            'duration': '2 weeks',
            'completed': false,
          },
          {
            'title': 'Social Media Marketing',
            'description': 'Master social media platforms and content strategy',
            'duration': '3 weeks',
            'completed': false,
          },
          {
            'title': 'SEO & Analytics',
            'description': 'Learn search engine optimization and web analytics',
            'duration': '3 weeks',
            'completed': false,
          },
        ],
        'milestones': [
          'Create a social media campaign',
          'Optimize website for SEO',
          'Analyze marketing metrics',
          'Launch a digital marketing campaign',
        ],
        'badges': [
          'Digital Marketer',
          'Social Media Expert',
          'SEO Specialist',
          'Analytics Pro',
        ],
      },
    };

    return programs[id] ?? programs['data_analytics']!;
  }

  @override
  Widget build(BuildContext context) {
    final program = _getProgramDetails(programId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Skillup',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/programs'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program Title
            Text(
              program['title'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            
            // Program Description
            Text(
              program['description'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            
            // Modules Section
            const Text(
              'Modules',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            
            ...program['modules'].map<Widget>((module) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: module['completed'] 
                            ? const Color(0xFF2E7D32)
                            : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        module['completed'] ? Icons.check : Icons.play_arrow,
                        color: module['completed'] ? Colors.white : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            module['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      module['duration'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            
            const SizedBox(height: 24),
            
            // Milestones & Badges Section
            const Text(
              'Milestones & Badges',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Complete all modules and projects to earn your pathway certification and unlock these achievements:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Badges
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: program['badges'].map<Widget>((badge) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Start Course Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Starting ${program['title']}...'),
                      backgroundColor: const Color(0xFF2E7D32),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Start Course',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/programs');
              break;
            case 2:
              // Profile screen - navigate to profile
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
