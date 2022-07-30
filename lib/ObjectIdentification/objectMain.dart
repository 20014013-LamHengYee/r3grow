import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:r3grow/ObjectIdentification/camera.dart';

class ObjectDetectMain extends StatefulWidget {
  late final List<CameraDescription> cameras;
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  }
  
  ObjectDetectMain(this.cameras);
  @override
  _ObjectDetectMainState createState() => _ObjectDetectMainState();
}

class _ObjectDetectMainState extends State<ObjectDetectMain> {
  String predOne = '';
  double confidence = 0;
  double index = 0;

   

  @override
  void initState() {
    super.initState();
    loadTfliteModel();
  }

  loadTfliteModel() async {
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt"))!;
    print(res);
  }

  setRecognitions(outputs) {
    print(outputs);

    if (outputs[0]['index'] == 0) {
      // metal
      index = 0;
    } else if (outputs[0]['index'] == 1) {
      // paper
      index = 1;
    } else if (outputs[0]['index'] == 2) {
      // plastic
      index = 2;
    } else if (outputs[0]['index'] == 3) {
      // E-Waste
      index = 3;
    } else {
      // others | cannot sensor | rubbish
      index = 4;
    }

    confidence = outputs[0]['confidence'];

    setState(() {
      predOne = outputs[0]['label'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          "Object Detection",
        ),
        backgroundColor:const Color(0xFFA7C474),
      ),
      body: Stack(
        children: [
          Container(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 260),
                  child: Camera(widget.cameras, setRecognitions))),
          // Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //////////////////////////// METAL ////////////////////////////
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Metal',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.blueGrey),
                                          value: index == 0 ? confidence : 0.0,
                                          backgroundColor:
                                              Colors.blueGrey.withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 0 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            /////////////////////////////// PAPER ////////////////////////////
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Paper',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.orange),
                                          value: index == 1 ? confidence : 0.0,
                                          backgroundColor:
                                              Colors.orange.withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 1 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //////////////////////////// PLASTIC ////////////////////////////
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Plastic',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.blueAccent),
                                          value: index == 2 ? confidence : 0.0,
                                          backgroundColor: Colors.blueAccent
                                              .withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 2 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //////////////////////////// EWASTE ////////////////////////////
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Ewaste',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.green),
                                          value: index == 3 ? confidence : 0.0,
                                          backgroundColor:
                                              Colors.green.withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 3 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            //////////////////////////// RUBBISH ////////////////////////////
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Invalid',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.red),
                                          value: index == 4 ? confidence : 0.0,
                                          backgroundColor:
                                              Colors.red.withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 4 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
