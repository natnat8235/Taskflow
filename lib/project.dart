import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart'; // Import DateFormat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Project Page'),
        ),
        body: const ProjectPageBody(),
      ),
    );
  }
}

class ProjectPageBody extends StatefulWidget {
  const ProjectPageBody({super.key});

  @override
  State<ProjectPageBody> createState() => _ProjectPageBodyState();
}

class _ProjectPageBodyState extends State<ProjectPageBody> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController ownerController = TextEditingController();
  TextEditingController priorityController = TextEditingController(); // Controller for priority text input
  bool isPriorityExpanded = false;
  String? selectedPriority;
  String? projectName;
  String? status;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 50, right: 50), // Added right padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // Take up available width
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF333333).withOpacity(0.27),
                  width: 2,
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                  hintText: 'Search for items',
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Adding some space between the search bar and the button
            Container(
              width: double.infinity, // Take up available width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF216DD9),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: _addProject,
                    child: const Text(
                      '+ Add Project',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adding some space between the button and the "Project Name"
            const Text(
              'PROJECT NAME',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            Container(
              width: double.infinity, // Take up available width
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF333333).withOpacity(0.27),
                  width: 2,
                ),
              ),
              child: TextFormField(
                onChanged: (value) => projectName = value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Enter project name',
                ),
              ),
            ),

            const SizedBox(height: 20), // Adding some space between the "Project Name" and the "STATUS"
            const Text(
              'STATUS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            Container(
              width: double.infinity, // Take up available width
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF333333).withOpacity(0.27),
                  width: 2,
                ),
              ),
              child: TextFormField(
                onChanged: (value) => status = value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Enter status',
                ),
              ),
            ),

            const SizedBox(height: 20), // Adding some space between the "STATUS" and the "DUE DATE"
            const Text(
              'DUE DATE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Take up available width
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF333333).withOpacity(0.27),
                      width: 2,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      hintText: startDate != null ? formatDate(startDate!, [mm, '/', dd, '/', yyyy]) : 'Start Date',
                      hintStyle: const TextStyle(
                        color: Color(0xFF333333),
                      ),
                    ),
                    onTap: () {
                      _selectDate(context, isStartDate: true);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'To',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity, // Take up available width
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF333333).withOpacity(0.27),
                      width: 2,
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      hintText: endDate != null ? formatDate(endDate!, [mm, '/', dd, '/', yyyy]) : 'End Date',
                      hintStyle: const TextStyle(
                        color: Color(0xFF333333),
                      ),
                    ),
                    onTap: () {
                      _selectDate(context, isStartDate: false);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adding some space between the "DUE DATE" and the "OWNER"
            const Text(
              'OWNER',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15), // Adding space between "OWNER" and the new container
            Container(
              width: double.infinity, // Take up available width
              height: 50, // Set height as per your requirement
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF333333).withOpacity(0.27),
                  width: 2,
                ),
              ),
              child: TextFormField(
                controller: ownerController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Enter owner',
                ),
              ),
            ),
            const SizedBox(height: 20), // Adding space between "OWNER" and "PRIORITY"
            const Text(
              'PRIORITY',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15), // Adding space between "PRIORITY" and the new container
            GestureDetector(
              onTap: () {
                setState(() {
                  isPriorityExpanded = !isPriorityExpanded;
                });
              },
              child: Container(
                width: double.infinity, // Take up available width
                height: 50, // Set height as per your requirement
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF333333).withOpacity(0.27),
                    width: 2,
                  ),
                  color: const Color(0xFF216DD9), // Set button color
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Priority',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      isPriorityExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            if (isPriorityExpanded)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF333333).withOpacity(0.27),
                    width: 2,
                  ),
                  color: const Color(0xFF216DD9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Low', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        _setPriority('Low');
                      },
                    ),
                    ListTile(
                      title: const Text('Medium', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        _setPriority('Medium');
                      },
                    ),
                    ListTile(
                      title: const Text('High', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        _setPriority('High');
                      },
                    ),
                  ],
                ),
              ),
            if (selectedPriority != null) // Display selected priority
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF333333).withOpacity(0.27),
                    width: 2,
                  ),
                ),
                child: Text(
                  'Selected Priority: $selectedPriority',
                  style: const TextStyle(color: Color(0xFF333333)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, {required bool isStartDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
        } else {
          endDate = pickedDate;
        }
      });
    }
  }

  void _setPriority(String priority) {
    setState(() {
      selectedPriority = priority;
      isPriorityExpanded = false; // Collapse the priority list
    });
  }

  void _addProject() {
    // Gather all entered information and create a new project
    final Map<String, dynamic> newProject = {
      'projectName': projectName,
      'status': status,
      'startDate': startDate,
      'endDate': endDate,
      'priority': selectedPriority,
    };

    // Display the new project in a box container
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Project'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Project Name: ${newProject['projectName']}'),
                const SizedBox(height: 8),
                Text('Status: ${newProject['status']}'),
                const SizedBox(height: 8),
                Text('Start Date: ${newProject['startDate']}'),
                const SizedBox(height: 8),
                Text('End Date: ${newProject['endDate']}'),
                const SizedBox(height: 8),
                Text('Priority: ${newProject['priority']}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
