import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart'; // Ajuste o caminho se necessário conforme o arquivo original

class CustomDrawer extends StatelessWidget {
  final String currentRoute;

  const CustomDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Cabeçalho do Menu
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Aqui vocês podem usar AppColors.primary depois
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu_book, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text(
                    'Alexandria',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // 1. Menu Inicial (Busca)
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Menu Inicial'),
            selected: currentRoute == AppRoutes.search, // Destaca se estiver na tela
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
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
                // Se não houver pushReplacement configurado nas rotas, use pushNamed
                Navigator.pushNamed(context, AppRoutes.favorites);
              }
            },
          ),
          
          // 3. Configurações (Configs)
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            selected: currentRoute == '/settings', // Caso criem uma rota futura de configs
            onTap: () {
              Navigator.pop(context);
              // TODO: Implementar rota de configurações se necessário, ou exibir um Dialog por enquanto
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tela de Configurações em desenvolvimento!')),
              );
            },
          ),
        ],
      ),
    );
  }
}