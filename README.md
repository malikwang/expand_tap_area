# ExpandTapArea

Manually expand the tap area of a widget without changing its size or layout. Similar with the *hitTest* in iOS development.

# Context

```
In the Human Interface Guidelines, Apple recommends a minimum target size of 44 x 44 px. In the Android Material Design Guidelines, it’s suggested that touch targets should be at least 48 x 48 dp.
```

# Usage

```dart
ExpandTapWidget(
  onTap: () {},
  tapPadding: EdgeInsets.all(25.0),
  child: smallWidget(),
),
```

More details see Demo.

# Attention

1. ExpandTapWidget can be wrapped inside/outside GestureDetector: **To avoid the conflict of gesture, it is better to apply on the innermost/smallest widget.**
2.  **The expanded area wouldn't exceed the boundary of the Parent Box.**

