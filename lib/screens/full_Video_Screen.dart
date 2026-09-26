import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullViveoScreen extends StatefulWidget {
  final String videoFile;
  final String heroTag;

  const FullViveoScreen({
    super.key,
    required this.videoFile,
    required this.heroTag,
  });

  @override
  State<FullViveoScreen> createState() => _FullViveoScreenState();
}

class _FullViveoScreenState extends State<FullViveoScreen> {
  late final VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoFile),
      );
      
      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController.value.aspectRatio,
      );
    } catch (e) {
      debugPrint("Ошибка загрузки видео: $e");
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Center(
        child: Hero(
          tag: widget.heroTag,
          child: _hasError
              ? const Text(
                  'Не удалось загрузить видео.\nПроверьте подключение или ссылку.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              : (_chewieController != null &&
                      _chewieController!.videoPlayerController.value.isInitialized)
                  ? Chewie(controller: _chewieController!)
                  : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}