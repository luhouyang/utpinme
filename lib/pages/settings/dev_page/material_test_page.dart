import 'package:flutter/material.dart';

import 'material_theme_col.dart';
import 'material_widget_lib.dart';

class MaterialTestPage extends StatelessWidget {
  const MaterialTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            elevation: 3,
            title: const Text('Dev Prev Page'),
            bottom: const TabBar(tabs: [
              Tab(
                text: "Widget/Component",
                icon: Icon(Icons.widgets_rounded),
              ),
              Tab(
                text: "Color  Palette",
                icon: Icon(Icons.palette_rounded),
              ),
            ])),
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              MaterialWidgetLibrary(),
              MaterialThemeColor(),
            ]),
      ),
    );
  }
}
