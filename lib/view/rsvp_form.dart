import 'package:flutter/material.dart';

import '../api/service_api.dart';
import '../model/event.dart';

class RSVPForm extends StatefulWidget {
  final Event event;

  RSVPForm({required this.event});

  @override
  _RSVPFormState createState() => _RSVPFormState();
}

class _RSVPFormState extends State<RSVPForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;
  String? _feedbackMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submitRSVP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _feedbackMessage = null;
      });

      bool success = await rsvpEvent(
        _nameController.text,
        _emailController.text,
        widget.event.title,
      );

      setState(() {
        _isLoading = false;
        _feedbackMessage =
            success ? 'RSVP successful!' : 'Failed to RSVP. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldInp(
            textEditingController: _nameController,
            hintText: 'Enter your name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFieldInp(
            textEditingController: _emailController,
            hintText: 'Enter your email',
            icon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _isLoading
              ? CircularProgressIndicator()
              : MyButton(
                  onTab: _submitRSVP,
                  text: 'RSVP',
                ),
          if (_feedbackMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                _feedbackMessage!,
                style: TextStyle(
                  color: _feedbackMessage == 'RSVP successful!'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTab, required this.text});

  final VoidCallback onTab;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.blue,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldInp extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;

  const TextFieldInp({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: isPass,
        controller: textEditingController,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.black45,
          ),
          hintStyle: TextStyle(color: Colors.black45, fontSize: 18),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFedf0f8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
