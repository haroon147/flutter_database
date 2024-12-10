import 'package:flutter/material.dart';

class JobListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Listing App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => JobDetailsScreen(),
        '/apply': (context) => ApplicationFormScreen(),
      },
    );
  }
}

// Mock Data for Jobs
final List<Map<String, String>> jobs = [
  {
    'title': 'Software Developer',
    'company': 'XYZ Tech',
    'location': 'San Francisco',
    'description': 'Full-stack developer, working with a modern tech stack.',
    'responsibilities': 'Develop and maintain web applications.',
  },
  {
    'title': 'Data Analyst',
    'company': 'ABC Analytics',
    'location': 'New York',
    'description': 'Analyze and interpret data to drive business decisions.',
    'responsibilities': 'Data analysis, visualization, and reporting.',
  },
  // Add more jobs as needed
];

// Home Screen with GridView of Job Cards
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: job,
                );
              },
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4.0),
                      Text('Company: ${job['company']}'),
                      Text('Location: ${job['location']}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Job Details Screen
class JobDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(job['description']!),
            SizedBox(height: 16.0),
            Text('Responsibilities:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(job['responsibilities']!),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/apply', arguments: job['title']);
              },
              child: Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}

// Application Form Screen
class ApplicationFormScreen extends StatefulWidget {
  @override
  _ApplicationFormScreenState createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Application Submitted Successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final jobTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for $jobTitle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty || !RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
