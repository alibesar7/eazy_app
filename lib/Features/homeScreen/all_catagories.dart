import 'package:flutter/material.dart';
import '../../utils/app_cubit.dart';
import 'homeScreen.dart';



class AllCatagories extends StatelessWidget {
  AllCatagories({super.key});

  static final List<Category> _allCategories = [
    Category(id: '1', name: 'الاستماع', imagePath: 'assets/images/icon6.png'),
    Category(id: '2', name: 'كلمات', imagePath: 'assets/images/icon2.png'),
    Category(id: '3', name: 'القواعد', imagePath: 'assets/images/icon4.png'),
    Category(id: '4', name: 'الاستماع', imagePath: 'assets/images/icon6.png'),
    Category(id: '5', name: 'كلمات', imagePath: 'assets/images/icon2.png'),
    Category(id: '6', name: 'القواعد', imagePath: 'assets/images/icon4.png'),
    Category(id: '7', name: 'الاستماع', imagePath: 'assets/images/icon6.png'),
    Category(id: '8', name: 'كلمات', imagePath: 'assets/images/icon2.png'),
    Category(id: '9', name: 'القواعد', imagePath: 'assets/images/icon4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildCategoriesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          const SizedBox(width: 24),
          const Expanded(
            child: Text(
              'الأقسام',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Shamel',
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 24),
          ),
        ],
      ),
    );
  }


  Widget _buildCategoriesGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          itemCount: _allCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final category = _allCategories[index];
            return _buildCategoryItem(category);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return GestureDetector(
      onTap: () => print('Tapped on ${category.name}'),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF1D71A1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                category.imagePath,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.category, size: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Shamel',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}