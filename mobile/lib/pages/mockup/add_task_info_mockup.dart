import 'package:flutter/material.dart';
import 'package:skillroot/pages/mockup/mock_data.dart';

class AddTaskInfoMockup extends StatefulWidget {
  const AddTaskInfoMockup({super.key});

  @override
  State<AddTaskInfoMockup> createState() => _AddTaskInfoMockupState();
}

class _AddTaskInfoMockupState extends State<AddTaskInfoMockup> {
  String? _selectedIndustry;
  String? _selectedOccupation;

  List<String> _availableOccupations = [];
  List<String> _availableTasks = [];

  final Set<String> _selectedTasks = {};

  void _onIndustryChanged(String? newIndustry) {
    setState(() {
      _selectedIndustry = newIndustry;
      _selectedOccupation = null;
      _availableOccupations = newIndustry != null
          ? MockData.occupations[newIndustry] ?? []
          : [];
      _availableTasks = [];
      _selectedTasks.clear();
    });
  }

  void _onOccupationChanged(String? newOccupation) {
    setState(() {
      _selectedOccupation = newOccupation;
      _availableTasks = newOccupation != null
          ? MockData.tasks[newOccupation] ?? []
          : [];
      _selectedTasks.clear();
    });
  }

  void _onFinish() {
    // Mock save action
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Job History Added Successfully!')),
    );
    // Return to the job history tab or profile
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job - Step 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Task Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Industry Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Industry',
                border: OutlineInputBorder(),
              ),
              initialValue: _selectedIndustry,
              items: MockData.industries.map((String industry) {
                return DropdownMenuItem<String>(
                  value: industry,
                  child: Text(industry),
                );
              }).toList(),
              onChanged: _onIndustryChanged,
            ),
            const SizedBox(height: 16),

            // Occupation Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Occupation',
                border: OutlineInputBorder(),
              ),
              initialValue: _selectedOccupation,
              items: _availableOccupations.map((String occupation) {
                return DropdownMenuItem<String>(
                  value: occupation,
                  child: Text(occupation),
                );
              }).toList(),
              onChanged: _availableOccupations.isNotEmpty
                  ? _onOccupationChanged
                  : null,
              disabledHint: const Text('Select an Industry first'),
            ),
            const SizedBox(height: 24),

            // Tasks Selection
            const Text(
              'Select Applicable Tasks:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: _availableTasks.isEmpty
                  ? Center(
                      child: Text(
                        _selectedOccupation == null
                            ? 'Select an occupation to view tasks'
                            : 'No tasks available for this occupation',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _availableTasks.length,
                      itemBuilder: (context, index) {
                        final task = _availableTasks[index];
                        final isSelected = _selectedTasks.contains(task);

                        return CheckboxListTile(
                          title: Text(task),
                          value: isSelected,
                          onChanged: (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                _selectedTasks.add(task);
                              } else {
                                _selectedTasks.remove(task);
                              }
                            });
                          },
                        );
                      },
                    ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedTasks.isNotEmpty ? _onFinish : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Finish & Save'),
            ),
          ],
        ),
      ),
    );
  }
}
