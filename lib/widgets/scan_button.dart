import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //const barcodeScanRes = 'https://fernando-herrera.com';
        //const barcodeScanRes = 'geo:45.287135,-75.920226';

        // Si el usuario cancela no se hace nada
        if ( barcodeScanRes == '-1' ) {
          return;
        }

        // busca en el arbol de widgets la instancia de ScanListProvider
        // ignore: use_build_context_synchronously
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        
        // ignore: use_build_context_synchronously
        launchURL(context, nuevoScan);
      }),
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      );
  }
}