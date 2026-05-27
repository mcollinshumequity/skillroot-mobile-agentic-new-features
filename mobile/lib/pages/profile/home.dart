// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new, annotate_overrides, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/animated_tab.dart';
import 'package:skillroot/widgets/hero_banner.dart';
import 'package:skillroot/widgets/stats.dart';
import 'package:skillroot/tab_screen.dart';

class HomeScreen extends StatefulWidget with AnimatedTab {
  final AnimationController animationController;
  final void Function(TabType) selectTab;

  const HomeScreen({super.key, required this.animationController, required this.selectTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static void contextClick(BuildContext context) {}
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin, AnimatedTabState {
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String greeting = user != null
        ? "Welcome, ${user.displayName ?? user.email ?? 'User'}"
        : "Welcome back";

    return buildAnimatedScaffold(
      context: context,
      header: buildHeader(
        context: context,
        title: greeting,
        selectTab: widget.selectTab,
      ),
      body: [
        HeroBanner(
          title: "Live training tracker",
          titleIcon: Icon(Icons.verified, color: secondaryColor, size: 18),
          headline: "Your proof of work travels with you.",
          tagline: "Record on-the-job wins, training, and certifications in one place.",
          chips: ["Training logged", "Jobs verified", "Certs & badges"],
        ),
        SizedBox(height: 18),
        StatsBlock([
          StatsCard(label: "Training hours", value: "128h", icon: Icons.timer_outlined),
          StatsCard(label: "Jobs logged", value: "24", icon: Icons.work_outline),
          StatsCard(label: "Proofs pending", value: "4", icon: Icons.verified_outlined),
        ]),
        SizedBox(height: 18),
        _buildRaiseHandCard(context),
        SizedBox(height: 18),
        _navGrid(context),
      ],
    );
  }

  Widget _navGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: tabItems.sublist(1).map<Widget>((item) {
        return InkWell(
          onTap: () => widget.selectTab(item.type),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: _cardGradient(item.type), begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 18, offset: const Offset(0, 12))],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), borderRadius: BorderRadius.circular(12)),
                  child: Icon(item.icon, color: Colors.white),
                ),
                Spacer(),
                Text(
                  item.text,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                ),
                SizedBox(height: 6),
                Text(
                  _cardCopy(item.type),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white.withValues(alpha: 0.9)),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  List<Color> _cardGradient(TabType type) {
    switch (type) {
      case TabType.Profile:
        return [Color(0xff0B72C7), Color(0xff0A4E96)];
      case TabType.JobHistory:
        return [secondaryColor, Color(0xfff6a548)];
      case TabType.Training:
        return [Color(0xff0B72C7), secondaryColor];
      case TabType.Notifications:
        return [Color(0xff1f2a3d), Color(0xff395275)];
      case TabType.Home:
        return [primaryColor, secondaryColor];
    }
  }

  String _cardCopy(TabType type) {
    switch (type) {
      case TabType.Profile:
        return "Your verified story";
      case TabType.JobHistory:
        return "Log work outcomes";
      case TabType.Training:
        return "Track learning hours";
      case TabType.Notifications:
        return "Approvals & reminders";
      case TabType.Home:
        return "";
    }
  }

  Widget _buildRaiseHandCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.08)),
      ),
      padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [secondaryColor, Color(0xfff6a548)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.pan_tool_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Need assistance?",
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Raise your hand to send a quick message to your instructor.",
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.disabledColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: theme.cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) => _RaiseHandBottomSheet(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Raise Hand",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.pan_tool,
                  color: Colors.white,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum RaiseHandFormState { input, loading, success }

class _RaiseHandBottomSheet extends StatefulWidget {
  @override
  State<_RaiseHandBottomSheet> createState() => _RaiseHandBottomSheetState();
}

class _RaiseHandBottomSheetState extends State<_RaiseHandBottomSheet> {
  final _messageController = TextEditingController();
  String _selectedCategory = 'Question';
  RaiseHandFormState _currentState = RaiseHandFormState.input;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _buildContent(theme, isDark),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, bool isDark) {
    switch (_currentState) {
      case RaiseHandFormState.input:
        return _buildInputForm(theme, isDark);
      case RaiseHandFormState.loading:
        return _buildLoading(theme);
      case RaiseHandFormState.success:
        return _buildSuccess(theme, isDark);
    }
  }

  Widget _buildInputForm(ThemeData theme, bool isDark) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 5,
            margin: EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "Raise your hand 🖐️",
              style: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Need help or want to flag something? Select a category and type a message to notify your manager.",
          style: theme.textTheme.bodySmall!.copyWith(
            color: theme.disabledColor,
            fontSize: 13,
            height: 1.4,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "SELECT CATEGORY",
          style: theme.textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: secondaryColor,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['Question', 'Issue', 'Feedback', 'Help'].map((category) {
              final isSelected = _selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 16),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  selectedColor: primaryColor.withValues(alpha: isDark ? 0.25 : 0.12),
                  labelStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: isSelected ? primaryColor : (isDark ? Colors.grey[400] : Colors.black54),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
                  ),
                  backgroundColor: isDark ? Color(0xff1B1D21) : Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected ? primaryColor : (isDark ? Colors.grey[800]! : Colors.grey[300]!),
                      width: 1,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) _selectedCategory = category;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Text(
          "YOUR MESSAGE",
          style: theme.textTheme.labelSmall!.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: secondaryColor,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _messageController,
          maxLines: 4,
          style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
          decoration: InputDecoration(
            hintText: "Type your message here...",
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.disabledColor.withValues(alpha: 0.6),
              fontSize: 14,
            ),
            filled: true,
            fillColor: isDark ? Color(0xff1B1D21) : Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
            ),
          ),
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Cancel",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: isDark ? Colors.grey[400] : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_messageController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please type a message first"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }
                  setState(() {
                    _currentState = RaiseHandFormState.loading;
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _currentState = RaiseHandFormState.success;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Send message",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoading(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
          SizedBox(height: 16),
          Text(
            "Raising your hand...",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess(ThemeData theme, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 64,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Hand Raised!",
            style: theme.textTheme.headlineSmall!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Your '$_selectedCategory' notification has been sent. Your training manager or instructor has been alerted and will reach out to you shortly.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.disabledColor,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "Got it",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
