import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class LandingPageController extends GetxController {
  static const heroImageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/d/dc/City_University_of_Bangladesh.jpg';

  final searchController = TextEditingController();
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = const <ThesisCategory>[
    ThesisCategory(name: 'All', count: 126),
    ThesisCategory(name: 'Artificial Intelligence', count: 24),
    ThesisCategory(name: 'Data Science', count: 18),
    ThesisCategory(name: 'Software Engineering', count: 22),
    ThesisCategory(name: 'Cybersecurity', count: 14),
    ThesisCategory(name: 'IoT', count: 19),
    ThesisCategory(name: 'Networks', count: 11),
  ];

  final theses = const <ThesisItem>[
    ThesisItem(
      title: 'Smart Traffic Monitoring Using Edge Vision',
      researcher: 'Nabila Rahman',
      supervisor: 'Dr. Farhana Islam',
      category: 'Artificial Intelligence',
      department: 'Computer Science and Engineering',
      year: '2026',
      tag: 'AI',
      summary:
          'A real-time traffic analysis platform that detects congestion patterns and recommends dynamic routing decisions.',
      accent: Color(0xFF0F766E),
    ),
    ThesisItem(
      title: 'Predictive Student Dropout Analysis with Explainable Models',
      researcher: 'Fahim Hasan',
      supervisor: 'Dr. Sadia Karim',
      category: 'Data Science',
      department: 'Computer Science and Engineering',
      year: '2025',
      tag: 'DATA',
      summary:
          'A classification pipeline for academic risk prediction with interpretable model outputs for university decision support.',
      accent: Color(0xFF2563EB),
    ),
    ThesisItem(
      title: 'Microservice-Based Campus Service Portal',
      researcher: 'Tasnia Noor',
      supervisor: 'Dr. M. R. Hossain',
      category: 'Software Engineering',
      department: 'Software Engineering',
      year: '2026',
      tag: 'SE',
      summary:
          'A modular service platform integrating student requests, approvals, and digital service tracking across departments.',
      accent: Color(0xFFEA580C),
    ),
    ThesisItem(
      title:
          'Lightweight Intrusion Detection for Academic Networks in Low-Resource Environments',
      researcher: 'Shahriar Kabir',
      supervisor: 'Dr. Tanjina Akter',
      category: 'Cybersecurity',
      department: 'Information Technology',
      year: '2025',
      tag: 'SEC',
      summary:
          'A network anomaly detection approach optimized for low-resource university environments and quick incident response.',
      accent: Color(0xFF7C3AED),
    ),
    ThesisItem(
      title: 'IoT-Based Smart Energy Meter for Campus Buildings',
      researcher: 'Morshed Alam',
      supervisor: 'Dr. Ayesha Sultana',
      category: 'IoT',
      department: 'Electrical and Electronic Engineering',
      year: '2024',
      tag: 'IOT',
      summary:
          'A distributed sensor system for monitoring building-level power usage and generating actionable efficiency insights.',
      accent: Color(0xFF0891B2),
    ),
    ThesisItem(
      title: 'Adaptive QoS Scheduling for Hybrid Learning Networks',
      researcher: 'Ritu Moni',
      supervisor: 'Dr. Imran Mahmud',
      category: 'Networks',
      department: 'Computer Science and Engineering',
      year: '2026',
      tag: 'NET',
      summary:
          'A scheduling strategy that improves classroom streaming quality over mixed wired and wireless campus infrastructure.',
      accent: Color(0xFFBE123C),
    ),
  ];

  List<ThesisItem> get filteredTheses {
    final query = searchQuery.value.trim().toLowerCase();

    return theses.where((thesis) {
      final matchesCategory =
          selectedCategory.value == 'All' ||
          thesis.category == selectedCategory.value;

      final matchesQuery =
          query.isEmpty ||
          thesis.title.toLowerCase().contains(query) ||
          thesis.researcher.toLowerCase().contains(query) ||
          thesis.category.toLowerCase().contains(query) ||
          thesis.department.toLowerCase().contains(query);

      return matchesCategory && matchesQuery;
    }).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateSearch(String value) {
    searchQuery.value = value;
  }

  void submitSearch() {
    updateSearch(searchController.text);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.auth);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class ThesisCategory {
  const ThesisCategory({required this.name, required this.count});

  final String name;
  final int count;
}

class ThesisItem {
  const ThesisItem({
    required this.title,
    required this.researcher,
    required this.supervisor,
    required this.category,
    required this.department,
    required this.year,
    required this.tag,
    required this.summary,
    required this.accent,
  });

  final String title;
  final String researcher;
  final String supervisor;
  final String category;
  final String department;
  final String year;
  final String tag;
  final String summary;
  final Color accent;
}
