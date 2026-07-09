import 'package:flutter/material.dart';
import 'package:library_of_alexandria/core/theme/app_colors.dart';
import '../../../routes/app_routes.dart'; // Ajuste se necessário

class CustomDrawer extends StatelessWidget {
  final String currentRoute;

  const CustomDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.marble,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true, // Remove espaçamentos fantasmas do topo
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho Customizado e Seguro
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50, bottom: 20, left: 16, right: 16),
              decoration: const BoxDecoration(
                color: AppColors.royalPurple,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu_book, color: Colors.white, size: 36),
                  SizedBox(height: 8),
                  Text(
                    'Alexandria',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            // 1. Menu Inicial (Busca)
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Menu Inicial'),
              selected: currentRoute == AppRoutes.search,
              onTap: () {
                Navigator.pop(context);
                if (currentRoute != AppRoutes.search) {
                  Navigator.pushReplacementNamed(context, AppRoutes.search);
                }
              },
            ),
            
            // 2. Favoritos
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              selected: currentRoute == AppRoutes.favorites,
              onTap: () {
                Navigator.pop(context);
                if (currentRoute != AppRoutes.favorites) {
                  Navigator.pushNamed(context, AppRoutes.favorites);
                }
              },
            ),
            
            // 3. Configurações
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              selected: currentRoute == '/settings',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Configurações em desenvolvimento!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}