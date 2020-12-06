import 'dart:io';

import 'package:anime_dart/app/screens/config/widgets/section_label.dart';
import 'package:anime_dart/app/screens/config/widgets/section_tile.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DataManagerSection extends StatefulWidget {
  DataManagerSection({Key key}) : super(key: key);

  @override
  _DataManagerSectionState createState() => _DataManagerSectionState();
}

class _DataManagerSectionState extends State<DataManagerSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel('Gerenciamento de dados'),
        SectionTile(
          leading: Icon(Icons.bookmark),
          title: Text('Exportar histórico de assistidos'),
          onTap: _exportWatchedData,
        ),
        SectionTile(
          leading: Icon(Icons.favorite),
          title: Text('Exportar favoritos'),
        ),
        SectionTile(
          leading: Icon(Icons.backup),
          title: Text('Exportar tudo'),
        ),
        SectionTile(
          leading: Icon(Icons.cloud_download),
          title: Text('Importar dados'),
        ),
      ],
    );
  }

  void _exportWatchedData() async {
    String path = await FilesystemPicker.open(
      title: 'Save to folder',
      context: context,
      rootDirectory: Directory.fromUri(
        Uri.parse(
          (await getDownloadsDirectory()).path,
        ),
      ),
      fsType: FilesystemType.folder,
      pickText: 'Salvar o arquivo de backup nesta pasta',
      folderIconColor: Colors.teal,
    );

    print(path);
  }
}
