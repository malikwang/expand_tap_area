# ExpandTapArea

Manually expand the tap area of a widget without changing its size or layout. Similar with the *hitTest* in iOS development.

# Context

```
In the Human Interface Guidelines, Apple recommends a minimum target size of 44 x 44 px. 
In the Android Material Design Guidelines, it’s suggested that touch targets should be at least 48 x 48 dp.
```
Inspired by [issue](https://github.com/flutter/flutter/issues/31728)

# Usage

```dart
ExpandTapWidget(
  onTap: () {},
  tapPadding: EdgeInsets.all(25.0),
  child: smallWidget(),
),
```

# Demo

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <a href="https://raw.githubusercontent.com/malikwang/expand_tap_area/master/images/1.png">
                    <img src="https://raw.githubusercontent.com/malikwang/expand_tap_area/master/images/1.png" width="300"/>
                </a>
            </td>            
            <td style="text-align: center">
                <a href="https://raw.githubusercontent.com/malikwang/expand_tap_area/master/images/2.png">
                    <img src="https://raw.githubusercontent.com/malikwang/expand_tap_area/master/images/2.png" width="300"/>
                </a>
            </td>  
        </tr>
    </table>
</div>

# Attention

1. ExpandTapWidget can be wrapped inside/outside GestureDetector: **To avoid the conflict of gesture, it is better to apply on the innermost/smallest widget.**
2.  **The expanded area wouldn't exceed the boundary of the Parent Box. You can set *debugPaintExpandAreaEnabled = true* to display the actual expanded area.**

