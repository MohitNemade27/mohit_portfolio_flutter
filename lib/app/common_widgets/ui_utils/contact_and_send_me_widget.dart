import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;

  const ContactForm({super.key, required this.isMobile, required this.isTablet});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _sendMail() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final subject = Uri.encodeComponent(_subjectController.text);
      final body = Uri.encodeComponent(
        '''
Name: $name
Email: $email

Message:
${_messageController.text}
''',
      );

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'mohitnemade27@gmail.com',
        query: 'subject=$subject&body=$body',
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open mail client')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isMobile
          ? MediaQuery.of(context).size.width * 0.9
          : widget.isTablet
              ? MediaQuery.of(context).size.width * 0.7
              : MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Send a Message",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField("Your Name", _nameController),
            const SizedBox(height: 15),
            _buildTextField("Your Email", _emailController, isEmail: true),
            const SizedBox(height: 15),
            _buildTextField("Subject", _subjectController),
            const SizedBox(height: 15),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter a message' : null,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration("Your Message"),
            ),
            const SizedBox(height: 20),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double width;
                  if (constraints.maxWidth < 600) {
                    width = constraints.maxWidth * 0.9; // Mobile
                  } else if (constraints.maxWidth < 1024) {
                    width = constraints.maxWidth * 0.5; // Tablet
                  } else {
                    width = constraints.maxWidth * 0.25; // Desktop
                  }

                  return SizedBox(
                    width: width,
                    child: ElevatedButton(
                      onPressed: _sendMail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Send Message"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $hint';
        if (isEmail && !RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) return 'Enter valid email';
        return null;
      },
      decoration: _inputDecoration(hint),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.all(15),
    );
  }
}
