import 'package:flutter/material.dart';
import 'package:esay_app/Features/homeScreen/homeScreen.dart'; // الاستيراد الصح فقط// Ensure this path is correct

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // Sample dynamic data
  final List<Map<String, String>> notifications = const [
    {
      'title': 'اسم الاشعارات',
      'content': 'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا\n'
          'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا',
      'isNew': 'true',
    },
    {
      'title': 'اسم الاشعارات',
      'content': 'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا\n'
          'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا',
      'isNew': 'false',
    },
    {
      'title': 'اسم الاشعارات',
      'content': 'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا\n'
          'تفاصيل الاشعارات هنا تفاصيل الاشعارات هنا',
      'isNew': 'false', // Added another new one for testing
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.arrow_forward_outlined),
          ),
        ],
        title: const Text(
          "الإشعارات",
          style: TextStyle(fontFamily: 'Shamel'),
        ),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? Center( // Handle empty notifications list
        child: Text(
          "لا توجد إشعارات حالياً",
          style: TextStyle(fontFamily: 'Shamel', fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder( // Use ListView.builder for efficiency
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final bool isNew = notification['isNew'] == 'true';

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              textDirection: TextDirection.rtl, // Lay out Row children from Right to Left
              crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top of the row
              children: [
                // Orange circle (will be on the visual right due to TextDirection.rtl)
                if (isNew) // Only show if the notification is new
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0), // Add some space to its left (visual right) and top
                    child: _buildNewIndicatorCircle(),
                  ),
                if (!isNew) // Add a placeholder if not new to maintain alignment, or adjust padding
                  const SizedBox(width: 12.0 + 8.0), // Width of circle + its padding

                // Notification card (will be on the visual left of the circle)
                Expanded( // Make the card take the remaining space
                  child: _buildNotificationItem(
                    title: notification['title']!,
                    content: notification['content']!,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Orange circle widget
  Widget _buildNewIndicatorCircle() {
    return Container(
      width: 12,
      height: 12,
      // Removed margin, will use Padding in the Row instead for better control
      decoration: const BoxDecoration(
        color: Color(0xFFFE9F45),
        shape: BoxShape.circle,
      ),
    );
  }

  // Notification item widget (remains mostly the same)
  Widget _buildNotificationItem({
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl, // Content within the card is also RTL
          children: [
            Image.asset(
              'assets/images/document_icon.png',
              width: 24,
              height: 24,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/doc.png',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.description, size: 24),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Shamel',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(
                      fontFamily: 'Shamel',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
