// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_zxing/flutter_zxing.dart' as zxing;

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  String qrCodeResult =
      'Nenhum código lido ainda'; // Armazena o resultado do QR code
  bool isScanning = true; // Variável para controle do estado de escaneamento

  // Função chamada quando o código QR é escaneado com sucesso
  void _onScanSuccess(zxing.Barcode? code) {
    setState(() {
      qrCodeResult = code?.text ?? 'Nenhum código lido';
    });
  }

  // Função chamada em caso de falha no escaneamento (opcional)
  void _onScanFailure() {
    setState(() {
      qrCodeResult = 'Falha ao ler o código';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leitor de QR Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: zxing.ReaderWidget(
              onScan: (code) {
                _onScanSuccess(
                    code); // Chama a função de sucesso e atualiza o estado
                setState(() {
                  isScanning = false;
                });
              },
              onScanFailure: _onScanFailure, // Trata falha de leitura
              resolution: zxing.ResolutionPreset.low, // Qualidade da câmera
              showFlashlight: false, // Não exibe o botão de lanterna
              showGallery: false, // Não exibe o botão de galeria
              showToggleCamera: false, // Não exibe o botão de alternar câmera
              lensDirection:
                  zxing.CameraLensDirection.back, // Usa a câmera traseira
              scanDelaySuccess:
                  const Duration(milliseconds: 2000), // Delay após sucesso
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Código lido: $qrCodeResult',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
