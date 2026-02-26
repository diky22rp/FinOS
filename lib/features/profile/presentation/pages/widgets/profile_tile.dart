import 'package:finos/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;
  const ProfileTile({
    super.key,
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        highlightColor: const Color(0xFFE6F0FF),
        splashColor: AppColors.primary.withAlpha(40),
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF6B6B6B)),
          title: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          trailing:
              trailing ??
              const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 2,
          ),
          minLeadingWidth: 0,
        ),
      ),
    );
  }
}
