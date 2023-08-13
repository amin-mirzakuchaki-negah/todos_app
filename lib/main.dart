import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'features/todo_list/presentation/screens/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Colors.greenAccent),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
