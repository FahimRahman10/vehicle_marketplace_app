import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

enum UserRole { admin, seller, customer }

class _ProfileScreenState extends State<ProfileScreen> {
  UserRole _selectedRole = UserRole.customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButton<UserRole>(
                value: _selectedRole,
                onChanged: (UserRole? newRole) {
                  if (newRole != null) {
                    setState(() => _selectedRole = newRole);
                  }
                },
                items: UserRole.values.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role.name.toUpperCase()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 130,
                width: 130,
                child: Image.asset('lib/images/profile.png'),
              ),
              const SizedBox(height: 20),
              Text(
                _getRoleTitle(_selectedRole),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: _getProfileOptions(_selectedRole),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getRoleTitle(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return "Admin";
      case UserRole.seller:
        return "Seller Name: Hero Motors";
      case UserRole.customer:
      return "Customer Name: Fahim Rahman";
    }
  }

  List<Widget> _getProfileOptions(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return [
          _buildTile("Manage Users", Icons.supervisor_account),
          _buildTile("Manage Products", Icons.shopping_cart),
          _buildTile("View Reports", Icons.bar_chart),
          _buildTile("Settings", Icons.settings),
        ];
      case UserRole.seller:
        return [
          _buildTile("My Listings", Icons.directions_car),
          _buildTile("Manage Listings", Icons.edit),
          _buildTile("Add New Car", Icons.add_circle),
          _buildTile("Sales Stats", Icons.show_chart),
        ];
      case UserRole.customer:
      return [
          _buildTile("My Orders", Icons.shopping_bag),
          _buildTile("My Cart", Icons.shopping_cart),
          _buildTile("Wishlist", Icons.favorite),
          _buildTile("Account Settings", Icons.settings),
        ];
    }
  }

  Widget _buildTile(String title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title tapped')),
          );
        },
      ),
    );
  }
}
