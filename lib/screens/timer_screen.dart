import 'dart:async';
import 'dart:math' as math;
import 'package:fitjournal/const/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key, required this.title, required this.kg});
 final String title;
 final String kg;
  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int totalSeconds = 75;
  Timer? _timer;
  bool _isRunning = true;
  final ValueNotifier<int> _remainingSeconds = ValueNotifier<int>(75);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _remainingSeconds.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    if (!_isRunning) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds.value > 0) {
        _remainingSeconds.value--;
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });
    if (_isRunning) {
      _startTimer();
    } else {
      _timer?.cancel();
    }
  }

  void _adjustTime(int seconds) {
    _remainingSeconds.value += seconds;
    if (_remainingSeconds.value < 0) _remainingSeconds.value = 0;
    if (_remainingSeconds.value > totalSeconds) {
      totalSeconds = _remainingSeconds.value;
    }

    if (!_isRunning && _remainingSeconds.value > 0) {
      setState(() {
        _isRunning = true;
      });
      _startTimer();
    }
  }

  String _formatTime(int totalSecs) {
    int minutes = totalSecs ~/ 60;
    int seconds = totalSecs % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 95,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: LiquidGlassButton(
            // touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
            style: LiquidGlassStyle(
              shape: LiquidGlassShape(cornerRadius: 100),
              adaptivity: LiquidGlassAdaptivity(
                glassColorOnDark: Appcolors.whiteOpacity10,
                glassColorOnLight: Appcolors.whiteOpacity10,
                continuousGlassColor: true,
              ),
              liteGlass: LiquidGlassLitePickup.blend,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Appcolors.primary,
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 20),
        backgroundColor: Appcolors.scaffoldBodyColor,
        actions: [
          LiquidGlassButton(
            touch: LiquidGlassTouch(flex: LiquidGlassFlex()),
            style: LiquidGlassStyle(
              shape: LiquidGlassShape(cornerRadius: 100),
              adaptivity: LiquidGlassAdaptivity(
                glassColorOnDark: Appcolors.whiteOpacity10,
                glassColorOnLight: Appcolors.whiteOpacity10,
                continuousGlassColor: true,
              ),
              liteGlass: LiquidGlassLitePickup.blend,
            ),
            onPressed: () {},
            child: Text(
              widget.kg,
              style: TextStyle(fontSize: 18, color: Appcolors.primary),
            ),
          ),
        ],
      ),
      backgroundColor: Appcolors.scaffoldBodyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: _remainingSeconds,
              builder: (context, remaining, child) {
                final double targetProgress = remaining / totalSeconds;
                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 1.0, end: targetProgress),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear,
                  builder: (context, progress, child) {
                    return SizedBox(
                      width: 250,
                      height: 250,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(250, 250),
                            painter: TimerPainter(
                              progress: progress,
                              trackColor: Appcolors.whiteOpacity10,
                              progressColor: Appcolors.primary,
                              strokeWidth: 12,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ОТДЫХ МЕЖДУ СЕТАМИ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _formatTime(remaining),
                                style: const TextStyle(
                                  fontSize: 52,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Фаза восстановления',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Appcolors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeButton('-15 сек', () => _adjustTime(-15)),
                const SizedBox(width: 12),
                _buildTimeButton('+30 сек', () => _adjustTime(30)),
                const SizedBox(width: 12),
                _buildTimeButton('+60 сек', () => _adjustTime(60)),
              ],
            ),
            const SizedBox(height: 25),
            // Анимированная кнопка Старт/Пауза
            GestureDetector(
              onTap: _toggleTimer,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isRunning
                      ? Appcolors.whiteOpacity10
                      : Appcolors.primary,
                  boxShadow: _isRunning
                      ? []
                      : [
                          BoxShadow(
                            color: Appcolors.primary.withAlpha(1),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: RotationTransition(
                              turns: Tween<double>(
                                begin: 0.75,
                                end: 1.0,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                    child: Icon(
                      _isRunning
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      key: ValueKey<bool>(_isRunning),
                      color: _isRunning ? Colors.white : Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Appcolors.whiteOpacity10,
          borderRadius: BorderRadius.circular(20),
          border: Border(
            left: BorderSide(color: Appcolors.whiteOpacity30),
            right: BorderSide(color: Appcolors.whiteOpacity30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  TimerPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant TimerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}