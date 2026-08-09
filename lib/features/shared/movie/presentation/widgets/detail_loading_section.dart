import 'package:flutter/material.dart';

class DetailLoadingSection extends StatefulWidget {
  const DetailLoadingSection({super.key});

  @override
  State<DetailLoadingSection> createState() => DetailLoadingSectionState();
}

class DetailLoadingSectionState extends State<DetailLoadingSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  late final Animation<double> _pulse = Tween<double>(
    begin: 0.3,
    end: 0.85,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _bar({double width = double.infinity, double height = 13}) {
    return FadeTransition(
      opacity: _pulse,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }

  Widget _chip(double width) {
    return FadeTransition(
      opacity: _pulse,
      child: Container(
        width: width,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _infoCell() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bar(width: 70, height: 11),
        const SizedBox(height: 6),
        _bar(width: 110, height: 14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bar(),
        const SizedBox(height: 9),
        _bar(),
        const SizedBox(height: 9),
        _bar(width: 160),
        const SizedBox(height: 26),

        Row(
          children: [
            _chip(70),
            const SizedBox(width: 8),
            _chip(86),
            const SizedBox(width: 8),
            _chip(64),
          ],
        ),
        const SizedBox(height: 30),

        _bar(width: 60, height: 15),
        const SizedBox(height: 14),

        Row(
          children: [
            Expanded(child: _infoCell()),
            const SizedBox(width: 28),
            Expanded(child: _infoCell()),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(child: _infoCell()),
            const SizedBox(width: 28),
            Expanded(child: _infoCell()),
          ],
        ),
      ],
    );
  }
}