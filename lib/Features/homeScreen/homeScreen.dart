import 'package:esay_app/Features/personaLinformationScreen/Presentation/views/account_view.dart';
import 'package:esay_app/Features/Mylesson/lessonScreen.dart';
import 'package:esay_app/Features/Mylesson/no_lesson_screen.dart';
import 'package:esay_app/Features/homeScreen/search_found_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esay_app/utils/app_cubit.dart' hide Category;
import 'package:esay_app/utils/app_state.dart';
import 'package:esay_app/utils/search_cubit.dart';
import '../../utils/home_cubit.dart';
import '../NotificatonsScreen/notificationScreen.dart';
import 'all_catagories.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomeScreen({super.key});

  void _performSearch(BuildContext context) {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال نص للبحث')),
      );
      return;
    }

    context.read<SearchCubit>().search(query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<SearchCubit>(context),
          child: const SearchFoundResult(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _AppTitle(),
          IconButton(
            icon: Image.asset(
              'assets/images/notification.png',
              height: 28,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.notifications, size: 28),
            ),
            onPressed: () => _navigateToNotifications(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchField(context),
                  const SizedBox(height: 20),
                  _buildOfferBanner(state),
                  const SizedBox(height: 20),
                  _buildBannerIndicators(state),
                  const SizedBox(height: 20),
                  _buildCategoriesHeader(context),
                  const SizedBox(height: 10),
                  _buildCategoriesGrid(state),
                  const SizedBox(height: 20),
                  _buildContinueLessonsHeader(),
                  const SizedBox(height: 10),
                  if (state.currentLesson != null)
                    _buildCurrentLessonCard(state.currentLesson!),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchController,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontFamily: 'Shamel',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "ابحث عن درس",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () => _performSearch(context),
            child: Image.asset(
              'assets/images/search.png',
              width: 20,
              height: 20,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.search, size: 20),
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      onSubmitted: (_) => _performSearch(context),
    );
  }

  Widget _buildOfferBanner(HomeLoaded state) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/offer.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBannerIndicators(HomeLoaded state) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(2, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: index == state.bannerIndex
                  ? const Color(0xFFF9BC66)
                  : const Color(0x2A72AD4D),
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCategoriesHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "الأقسام",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontFamily: 'Shamel', fontSize: 16),
        ),
        TextButton(
          child: const Text(
            'المزيد',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFFFE9F45),
                fontSize: 14),
          ),
          onPressed: () => _navigateToAllCategories(context),
        ),
      ],
    );
  }

  Widget _buildCategoriesGrid(HomeLoaded state) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      children: state.categories
          .map((category) => CategoryItem(category: category))
          .toList(),
    );
  }

  Widget _buildContinueLessonsHeader() {
    return const Text(
      "استكمل دروسك",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'Shamel',
      ),
    );
  }

  Widget _buildCurrentLessonCard(Lesson lesson) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                lesson.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 200),
              Image.asset(
                'assets/images/save.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "4 أسئلة تقييم وتمارين",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/timer1.png',
                width: 10,
                height: 10,
              ),
              const SizedBox(width: 5),
              Text(
                lesson.duration,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A72AD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "استكمل",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: 'Shamel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: LinearProgressIndicator(
                    value: lesson.progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.orange,
                    minHeight: 13,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/end.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(
                  context,
                  iconPath: 'assets/images/book.png',
                  label: 'دروسي',
                  category: 'دروسي',
                  destination: LessonsScreen(),
                ),
                const SizedBox(width: 40),
                _buildBottomNavItem(
                  context,
                  iconPath: 'assets/images/acc.png',
                  label: 'حسابي',
                  category: 'حسابي',
                  destination: AccountView(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required String category,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () {
        context.read<AppCubit>().selectCategory(category);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) =>
                Icon(label == 'حسابي' ? Icons.person_outline : Icons.menu_book),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () => print("Home button tapped"),
      child: Image.asset(
        'assets/images/home.png',
        width: 60,
        height: 60,
      ),
    );
  }

  void _navigateToNotifications(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => NotificationsScreen()),
    );
  }

  void _navigateToAllCategories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllCatagories()),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "مرحبا بك في التطبيق",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Shamel',
          ),
        ),
        const SizedBox(width: 5),
        Image.asset(
          'assets/images/eazyy.png',
          height: 40,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.school, size: 40),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.iconPath,
            height: 40,
            width: 40,
            errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
                fontWeight: FontWeight.w100,
                fontFamily: 'Shamel',
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
