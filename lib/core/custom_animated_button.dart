import 'package:flutter/material.dart';
import 'package:portfolio_site/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const AnimatedButton({super.key, required this.text, required this.onTap});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Assuming you have a provider for theme management
    final provider = Provider.of<ThemeProvider>(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween:
            Tween(begin: _isHovered ? 1.0 : 0.0, end: _isHovered ? 1.0 : 0.0),
        builder: (context, value, child) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: provider.isDarkTheme ? Colors.white : Colors.grey,
                ),
                gradient: LinearGradient(
                  colors: [
                    provider.isDarkTheme ? Colors.white : Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [value, value],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isHovered && provider.isDarkTheme
                        ? Colors.black
                        : !_isHovered && !provider.isDarkTheme
                            ? Colors.black
                            : Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
