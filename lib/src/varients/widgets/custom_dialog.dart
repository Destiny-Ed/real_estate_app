import 'package:flutter/material.dart';
import 'package:real_estate_app/style/colors.dart';

class CustomDialog extends StatefulWidget {
  final Offset tapPosition;

  const CustomDialog({super.key, required this.tapPosition});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: widget.tapPosition.dx - 70,
          top: widget.tapPosition.dy - MediaQuery.of(context).size.height / 3.5,
          // bottom: tapPosition.dy - 100,
          child: ScaleTransition(
            alignment: Alignment.bottomLeft,
            scale: _scaleAnimation,
            child: Material(
              color: Colors.transparent,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color(0xfffbf5eb),
                child: IntrinsicWidth(
                  stepWidth: MediaQuery.of(context).size.width / 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDialogItem(
                          icon: Icons.check_circle_outline,
                          text: 'Cosy areas',
                          iconColor: AppColors.grey,
                          textColor: AppColors.grey,
                          onTap: () {
                            _close();
                          },
                        ),
                        _buildDialogItem(
                          icon: Icons.price_change,
                          text: 'Price',
                          iconColor: AppColors.darkAmber,
                          textColor: AppColors.darkAmber,
                          onTap: () {
                            _close();
                          },
                        ),
                        _buildDialogItem(
                          icon: Icons.location_city,
                          text: 'Infrastructure',
                          iconColor: AppColors.grey,
                          textColor: AppColors.grey,
                          onTap: () {
                            _close();
                          },
                        ),
                        _buildDialogItem(
                          icon: Icons.layers_outlined,
                          text: 'Without any layer',
                          iconColor: Colors.grey,
                          textColor: Colors.grey,
                          onTap: () {
                            _close();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDialogItem({
    required IconData icon,
    required String text,
    required Color iconColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _close() {
    _controller.reverse().then((_) {
      _controller.dispose();
      Navigator.pop(context);
    });
  }
}
