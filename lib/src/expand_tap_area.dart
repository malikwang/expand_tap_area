import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';

bool debugPaintExpandAreaEnabled = false;
Color debugPaintExpandAreaColor = const Color(0xFF00FFFF).withOpacity(0.2);

class ExpandTapWidget extends SingleChildRenderObjectWidget {
  ExpandTapWidget({
    Key key,
    Widget child,
    this.onTap,
    this.tapPadding,
  }) : super(key: key, child: child);

  final VoidCallback onTap;
  final EdgeInsets tapPadding;

  @override
  RenderObject createRenderObject(BuildContext context) => _ExpandTapRenderBox(
        onTap: onTap,
        tapPadding: tapPadding,
      );
}

class _TmpGestureArenaMember extends GestureArenaMember {
  _TmpGestureArenaMember({
    this.onTap,
  });

  final VoidCallback onTap;

  @override
  void acceptGesture(int key) {
    if (this.onTap != null) {
      this.onTap();
    }
  }

  @override
  void rejectGesture(int key) {}
}

class _ExpandTapRenderBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  _ExpandTapRenderBox({
    this.onTap,
    this.tapPadding = EdgeInsets.zero,
  });

  final VoidCallback onTap;
  final EdgeInsets tapPadding;

  @override
  void performLayout() {
    child.layout(constraints, parentUsesSize: true);
    size = child.size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      final BoxParentData childParentData = child.parentData;
      context.paintChild(child, childParentData.offset + offset);
    }
    if (debugPaintExpandAreaEnabled && kDebugMode)
      debugPaintExpandArea(context, offset);
  }

  void debugPaintExpandArea(PaintingContext context, Offset offset) {
    RenderBox parentBox = parent as RenderBox;

    /// [parentPosition]: the offset of current renderbox's parent
    Offset parentPosition = Offset.zero;
    parentPosition = offset - localToGlobal(Offset.zero, ancestor: parentBox);

    /// we directly get this offset using the method [localToGlobal] of parentBox, like the following annotated code
    /// However, this result is inaccurate, you can uncomment to try out.
    // parentPosition = parentBox.localToGlobal(Offset.zero);

    Size parentSize = parentBox.size;
    Rect parentRect = Rect.fromLTWH(
      parentPosition.dx,
      parentPosition.dy,
      parentSize.width,
      parentSize.height,
    );
    final BoxParentData childParentData = child.parentData;
    Offset paintOffset = childParentData.offset + offset - tapPadding.topLeft;
    Rect paintRect = Rect.fromLTWH(
      paintOffset.dx,
      paintOffset.dy,
      size.width + tapPadding.horizontal,
      size.height + tapPadding.vertical,
    );
    if (paintRect.overlaps(parentRect)) {
      final Paint paint = Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 1.0
        ..color = debugPaintExpandAreaColor;
      context.canvas.drawRect(paintRect.intersect(parentRect), paint);
    }
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      _TmpGestureArenaMember member = _TmpGestureArenaMember(onTap: onTap);
      GestureBinding.instance.gestureArena.add(event.pointer, member);
    } else if (event is PointerUpEvent) {
      GestureBinding.instance.gestureArena.sweep(event.pointer);
    }
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    this.visitChildren((child) {
      if (child is RenderBox) {
        final BoxParentData parentData = child.parentData;
        if (child.hitTest(result, position: position - parentData.offset))
          return true;
      }
    });
    return false;
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    Rect expandRect = Rect.fromLTWH(
      0 - tapPadding.left,
      0 - tapPadding.top,
      size.width + tapPadding.right + tapPadding.left,
      size.height + tapPadding.top + tapPadding.bottom,
    );
    if (expandRect.contains(position)) {
      bool hitTarget =
          hitTestChildren(result, position: position) || hitTestSelf(position);
      if (hitTarget) {
        result.add(BoxHitTestEntry(this, position));
        return true;
      }
    }
    return false;
  }
}
