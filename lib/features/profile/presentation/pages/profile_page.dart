import 'package:finos/core/app_colors.dart';
import 'package:finos/core/widgets/global_notifier.dart';
import 'package:finos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finos/features/profile/presentation/pages/widgets/profile_tile.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF222B45),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF6B6B6B)),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            unauthenticated: () {
              context.go('/');
            },
            error: (msg) {
              GlobalNotifier.showSnackbar(
                msg,
                color: AppColors.snackbarError,
                icon: Icons.error_outline,
              );
            },
            orElse: () {},
          );
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            const SizedBox(height: 8),
            // Avatar & Name
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Color(0xFFE6E6E6),
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Alex M.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'alexm@example.com',
                    style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Account Settings
            const Text(
              'ACCOUNT SETTINGS',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ProfileTile(
              icon: Icons.person_outline,
              label: 'Personal Information',
              onTap: () {
                // TODO: Navigate to personal information page
              },
            ),
            ProfileTile(
              icon: Icons.lock_outline,
              label: 'Change Password',
              onTap: () {
                // TODO: Navigate to change password page
              },
            ),
            ProfileTile(
              icon: Icons.link,
              label: 'Linked Accounts',
              onTap: () {
                // TODO: Navigate to linked accounts page
              },
            ),
            const SizedBox(height: 24),
            // Preferences
            const Text(
              'PREFERENCES',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFBDBDBD),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ProfileTile(
              icon: Icons.notifications_none,
              label: 'Notifications',
              onTap: () {
                // TODO: Navigate to notifications settings
              },
            ),
            ProfileTile(
              icon: Icons.privacy_tip_outlined,
              label: 'Privacy & Security',
              onTap: () {
                // TODO: Navigate to privacy & security
              },
            ),
            ProfileTile(
              icon: Icons.language,
              label: 'Language',
              trailing: Text(
                'English',
                style: TextStyle(color: Color(0xFFBDBDBD)),
              ),
              onTap: () {
                // TODO: Navigate to language settings
              },
            ),
            const SizedBox(height: 32),
            // Log Out
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDECEC),
                  foregroundColor: const Color(0xFFE74C3C),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.signedOut());
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
