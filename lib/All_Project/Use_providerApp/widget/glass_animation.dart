import 'package:fast_app/All_Project/Use_providerApp/theme/app_color.dart';
import 'package:fast_app/All_Project/Use_providerApp/theme/glass_style.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


class GlassFab extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const GlassFab({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<GlassFab> createState() => _GlassFabState();
}

class _GlassFabState extends State<GlassFab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.focusedBorder.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ]
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: GlassStyles.glassGradient,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.glassBorder1,
                  ),
                ),
                child: Center(child: widget.icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}