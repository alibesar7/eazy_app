import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esay_app/utils/search_cubit.dart';

class SearchFoundResult extends StatefulWidget {
  const SearchFoundResult({super.key});

  @override
  State<SearchFoundResult> createState() => _SearchFoundResultState();
}

class _SearchFoundResultState extends State<SearchFoundResult> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentState = BlocProvider.of<SearchCubit>(context).state;
    if (currentState is SearchSuccess) {
      _searchController.text = currentState.query;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      context.read<SearchCubit>().search(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'نتائج البحث',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Search Field
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "ابحث عن درس",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () => _performSearch(),
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
                onSubmitted: (_) => _performSearch(),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchSuccess) {
                    return ListView(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      children: [
                        _buildResultCard(
                          title: 'زمن الماضي البسيط',
                          subtitle: 'الشرق 6',
                          showSubscribe: true,
                        ),
                        const SizedBox(height: 12),
                        _buildResultCard(
                          title: 'تكوين الجملة في زمن الماضي البسيط',
                          subtitle: 'قواعد اللغة',
                          showSubscribe: false,
                        ),
                        const SizedBox(height: 12),
                        _buildResultCard(
                          title: 'فهم القواعد',
                          subtitle: 'أساسيات النحو',
                          showSubscribe: false,
                        ),
                      ],
                    );
                  }

                  return const Center(child: Text('ابدأ بالبحث عن الدروس'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String subtitle,
    required bool showSubscribe,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if (showSubscribe)
                      Image.asset(
                        'assets/images/subscribe.png',
                        width: 87,
                        height: 27,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint("Error loading subscribe image: $error");
                          return Container(
                            width: 87,
                            height: 27,
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                'اشتراك',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/images/save.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.bookmark_border),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}