import 'package:flutter/material.dart';

/// EmptyAppBar is an empty AppBar for use in scaffolds to replace the mandatory appBar property.
///
class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
