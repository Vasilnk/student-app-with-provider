import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully. If you do not agree with the terms of this privacy policy, please do not access the application.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Information We Collect
              Text(
                'Information We Collect',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We may collect information about you in a variety of ways. The information we may collect includes:\n'
                '- **Personal Data:** Personally identifiable information, such as your name, email address, and phone number that you voluntarily give to us when you register with the app or when you choose to participate in various activities related to the app.\n'
                '- **Student Data:** Information related to students, including names, contact details, and academic records.\n'
                '- **Usage Data:** Information about your activity on and use of the app, including your IP address, browser type, and device identifiers.\n'
                '- **Location Data:** Information about your location, if you grant the app permission to access location data.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // How We Use Your Information
              Text(
                'How We Use Your Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We use the information we collect in the following ways:\n'
                '- **To Provide and Maintain Our Service:** To manage your registration and provide you with the services you request.\n'
                '- **To Improve Our Services:** To understand how users interact with our app and to make improvements.\n'
                '- **To Communicate With You:** To send you updates, notifications, and other information related to the app.\n'
                '- **To Protect Our Services:** To monitor for and prevent fraud and other illegal activities.\n'
                '- **To Comply With Legal Obligations:** To adhere to applicable laws and regulations.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Disclosure of Your Information
              Text(
                'Disclosure of Your Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We may share information we have collected about you in certain situations:\n'
                '- **With Your Consent:** We may disclose your information with your consent.\n'
                '- **To Comply With Legal Obligations:** We may disclose your information if required to do so by law or in response to valid requests by public authorities.\n'
                '- **Business Transfers:** We may share your information in connection with a business transfer, such as a merger or acquisition.\n'
                '- **Service Providers:** We may share your information with third-party service providers who assist us in operating our app and providing services to you.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Data Security
              Text(
                'Data Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We use administrative, technical, and physical security measures to help protect your information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Your Data Protection Rights
              Text(
                'Your Data Protection Rights',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Depending on your location, you may have the following rights regarding your personal data:\n'
                '- **Access:** You may request access to the personal data we hold about you.\n'
                '- **Correction:** You may request that we correct any inaccurate or incomplete data.\n'
                '- **Deletion:** You may request that we delete your personal data under certain conditions.\n'
                '- **Restriction:** You may request that we restrict the processing of your personal data.\n'
                '- **Objection:** You may object to the processing of your personal data for certain purposes.\n'
                '- **Data Portability:** You may request a copy of your personal data in a structured, commonly used format.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Changes to This Privacy Policy
              Text(
                'Changes to This Privacy Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Contact Us
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions about this Privacy Policy, please contact us:\n'
                '- **Email:** support@xyz.com\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
