import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Lab02Screen extends StatefulWidget {
  const Lab02Screen({super.key});

  @override
  State<Lab02Screen> createState() => _Lab02ScreenState();
}

class _Lab02ScreenState extends State<Lab02Screen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedRole = 'Student';

  // --- 1. Picker Methods[cite: 5, 6] ---

  Future<void> _selectMaterialDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 240,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() => _selectedDate = newDate);
          },
        ),
      ),
    );
  }

  void _showCupertinoRolePicker(BuildContext context) {
    final List<String> roles = ['Student', 'Developer', 'Designer'];
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (int index) {
            setState(() => _selectedRole = roles[index]);
          },
          children: roles.map((role) => Center(child: Text(role))).toList(),
        ),
      ),
    );
  }

  // --- 2. Adaptive Views[cite: 3, 4] ---

  Widget _buildPortraitView() {
    return ListView(
      children: [
        const StudentDetailsSection(),
        Image.asset('assets/swissalps.jpeg', height: 240, fit: BoxFit.cover),
        const TitleSection(name: 'Oeschinen Lake', location: 'Kandersteg, Switzerland', starCount: 41),
        const ActionButtonsSection(),
        const TextSection(),
        const Divider(),
        _buildPickerShowcase(),
      ],
    );
  }

  Widget _buildLandscapeView() {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: StudentDetailsSection(),
            )
        ),
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              Image.asset('assets/swissalps.jpeg', height: 200, fit: BoxFit.cover),
              const TitleSection(name: 'Oeschinen Lake', location: 'Kandersteg, Switzerland', starCount: 41),
              const ActionButtonsSection(),
              const TextSection(),
              const Divider(),
              _buildPickerShowcase(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPickerShowcase() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Selected Date: ${_selectedDate.toLocal()}'.split(' ')[0], style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Selected Role: $_selectedRole', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _selectMaterialDate(context),
                child: const Text('Material Date Picker'),
              ),
              ElevatedButton(
                onPressed: () => _showCupertinoDatePicker(context),
                child: const Text('Cupertino Date Picker'),
              ),
              ElevatedButton(
                onPressed: () => _showCupertinoRolePicker(context),
                child: const Text('Cupertino Wheel Picker'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: _selectedRole,
            items: ['Student', 'Developer', 'Designer'].map((String role) {
              return DropdownMenuItem<String>(
                value: role,
                child: Text(role),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => _selectedRole = newValue);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adaptive Layout')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView()
              : _buildLandscapeView();
        },
      ),
    );
  }
}

// --- 3. Decomposed Section Widgets[cite: 1, 2] ---

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 4),
          Text('$starCount'),
        ],
      ),
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer.',
        softWrap: true,
      ),
    );
  }
}

class StudentDetailsSection extends StatelessWidget {
  const StudentDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/my_photo.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sam Ling',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Student ID: BCS24020017',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Divider(height: 32, thickness: 1),
              const Text(
                'Personal Life Goal / Quote:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '"To be well-off in life without any worries."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}