part of 'widgets.dart';

class CustomCamera extends StatefulWidget {
  final Function() onCapture;

  const CustomCamera({super.key, required this.onCapture});

  @override
  _CustomCameraState createState() => _CustomCameraState();
}

class _CustomCameraState extends State<CustomCamera> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = false;
  final ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    initCamera();
  }

  void initCamera() async {
    try {
      cameras = await availableCameras();
      onNewCameraSelected(cameras[0]);
    } on CameraException catch (e) {
      print('Error in fetching the cameras: $e');
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      initCamera();
    } else if (state == AppLifecycleState.paused) {
      controller?.dispose();
      controller = null;
    } else if (state == AppLifecycleState.inactive) {
      controller!.dispose();
      controller = null;
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      cameraController.startImageStream((image) {});
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occurred while taking picture: $e');
      return null;
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    controller?.dispose();
    super.dispose();
  }

  void switchCamera() {
    if (cameras.isEmpty) return;

    _isRearCameraSelected = !_isRearCameraSelected;
    onNewCameraSelected(cameras[_isRearCameraSelected ? 0 : 1]);
  }

  @override
  Widget build(BuildContext context) {
    return _isCameraInitialized
        ? Stack(
            fit: StackFit.expand,
            children: [
              cameraWidget(context),
              Positioned(
                bottom: 20,
                left: (MediaQuery.of(context).size.width / 3),
                child: GestureDetector(
                  onTap: switchCamera,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text("RAW"),
                    ),
                  ),
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }

  Widget cameraWidget(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: CameraPreview(controller!),
      ),
    );
  }
}
