import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';

class ChangeDataScreen extends StatefulWidget {
  final OrderRepository orderRepository;

  const ChangeDataScreen({Key? key, required this.orderRepository}) : super(key: key);

  @override
  State<ChangeDataScreen> createState() => _ChangeDataScreenState();
}

class _ChangeDataScreenState extends State<ChangeDataScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Load user data from Firebase or any other source
    // For example:
    // final user = FirebaseAuth.instance.currentUser;
    // final name = user?.displayName;
    // final email = user?.email;
    // final phoneNumber = user?.phoneNumber;
    // setState(() {
    //   _nameController.text = name ?? '';
    //   _surnameController.text = surname ?? '';
    //   _phoneNumberController.text = phoneNumber ?? '';
    // });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Data', style: TextStyle(color: Colors.white)),
        backgroundColor: theme.colorScheme.primary, // Колір фону навбару
        toolbarHeight: 45,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/img/only_color_logo_no_background.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name and Surname',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Change name',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 156, 0, 0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color.fromRGBO(237, 156, 0, 1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  border: InputBorder.none, // remove bottom border
                ),
              ),
              SizedBox(height: 10), // Доданий відступ
              TextField(
                controller: _surnameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Change surname',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 156, 0, 0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color.fromRGBO(237, 156, 0, 1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  border: InputBorder.none, // remove bottom border
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Change email',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 156, 0, 0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color.fromRGBO(237, 156, 0, 1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  border: InputBorder.none, // remove bottom border
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: _phoneNumberController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Change phone number',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Color.fromRGBO(237, 156, 0, 0.1),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color.fromRGBO(237, 156, 0, 1)),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  border: InputBorder.none, // remove bottom border
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(237, 156, 0, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
