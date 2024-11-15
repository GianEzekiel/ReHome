import 'package:flutter/material.dart';
import 'package:rehome/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Declare separate state variables for each checkbox
    bool isChecked1 = false;  // For the first checkbox
    bool isChecked2 = false;  // For the second checkbox
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: CustomAppBar(
        title: "Profile",
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 377,
                height: 277,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF808080),
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                // Edit Profile Section
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatars/wony.jpg'),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'username@gmail.com',
                      style: TextStyle(
                        color: Color(0xff535763),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff000000),
                        foregroundColor: Color(0xFFFFFFFF),
                        fixedSize: Size(186, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Personal Information Section
              Container(
                width: 377,
                height: 383,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF808080),
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(label: 'Full Name', initialValue: 'Juan Dela Cruz'),
                      _buildTextField(label: 'Email', initialValue: 'username@gmail.com'),
                      _buildTextField(label: 'Phone', initialValue: '+63 912 345 6789'),
                      _buildTextField(label: 'Address', initialValue: 'Alangilan, Batangas City, Philippines'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),             
              // Adoption History Section
              Container(
                width: 377,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF808080),
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Adoption History',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:20, 
                            ),
                          ),
                        ],
                      ),
                      _buildAdoptionHistoryItem('Buddy', 'Adopted on April 20, 2024'),
                      _buildAdoptionHistoryItem('Catzy', 'Adopted on March 4, 2024'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Account Settings Section
              Container(
                width: 377,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF808080),
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Account Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:21 
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:15, 
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Receive updates about new pets available for adoption',
                          style: TextStyle(
                              fontSize:13, 
                          ),                         
                        ),
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value ?? false; // Update the state when clicked
                          });
                        },
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                      ),
                      const Text(
                        'Privacy Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:15, 
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Make my profile visible to other users',
                          style: TextStyle(
                              fontSize:13, 
                          ), 
                        ),
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value ?? false; // Update the state when clicked
                          });
                        },
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 347,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF808080),
                            width: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 347,
                        decoration: BoxDecoration(
                          color: Color(0xffEF4444),
                          border: Border.all(
                            color: const Color(0xFF808080),
                            width: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'Delete Account',
                              style: TextStyle(
                              color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String initialValue}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 4),
      SizedBox(
        width: 347,
        height: label == 'Address' ? 90 : 31, // Set different height for Address field
        child: TextFormField(
          initialValue: initialValue,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          ),
          maxLines: label == 'Address' ? 3 : 1, // Allow multiline input for Address field
        ),
      ),
      const SizedBox(height: 8),
    ],
  );
}


Widget _buildAdoptionHistoryItem(String name, String date) {
  return ListTile(
    dense: true,
    leading: const Icon(
      Icons.person,
      size: 28,
    ),
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15
      ),
    ),
    subtitle: Text(
      date,
      style: const TextStyle(
        fontSize: 12
      ),
    ),
  );
}
}
