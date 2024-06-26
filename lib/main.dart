import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialise le contrôleur d'animation
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Définit l'animation
    _animation = Tween<double>(begin: 0, end: 200).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // Démarre l'animation en boucle
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    // Libère les ressources liées à l'animation
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Page'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(git
              width: _animation.value,
              height: _animation.value,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}