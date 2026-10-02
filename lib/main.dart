import 'package:dartnative/dartnative.dart';

import 'dartnative_plugin_registrant.dart';

void main() {
  DartNativePluginRegistrant.registerAll();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _open());
  }

  void _open() {
    Navigator.push(context, PageRoute(builder: (_) => const AccountDeletedPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      brightness: Brightness.light,
      appBar: AppBar(title: const Text('Accounts')),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Button(title: 'Delete account', onPressed: _open),
      ),
    );
  }
}

class AccountDeletedPage extends StatelessWidget {
  const AccountDeletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      brightness: Brightness.light,
      appBar: AppBar(title: const Text('Account')),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          ListView(
            children: [
              for (final row in const ['Cash', 'Bank', 'Fuel card', 'Driver advance'])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Text(row, style: const TextStyle(fontSize: 17)),
                ),
            ],
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: const Color(0xD9E53935),
                padding: const EdgeInsets.all(24),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('No public Overlay / OverlayEntry',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFFFFFFFF))),
                    SizedBox(height: 12),
                    Text(
                      'Expected (Flutter): Overlay.of(context).insert(OverlayEntry(...)) '
                      'flashes red over the whole screen, app bar and sheets included, '
                      'and outlives this route.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Actual: this red layer is the page's own Stack, so it stops at the "
                      'body. The app bar and back button above are not covered, and the '
                      'layer goes away when the page is popped.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
