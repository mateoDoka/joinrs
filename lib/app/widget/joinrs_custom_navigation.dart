import 'package:flutter/material.dart';
import 'package:joinrs_flutter_challenge/app/joinrs_theme.dart';

class JoinrsBottomNavigation extends StatelessWidget {
  const JoinrsBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: JoinrsColorScheme.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => {},
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: JoinrsColorScheme.primaryOrange,
                          width: 2,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text("Work", style: JoinrsTextTheme.subtitle2)),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.slideshow,
                  color: JoinrsColorScheme.icon,
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.business,
                  color: JoinrsColorScheme.icon,
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.person,
                  color: JoinrsColorScheme.icon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
