import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokedex/core/helpers/camera_gallery_service.dart';

class CameraGalleryServiceImpl extends CameraGalleryService {
  final picker = ImagePicker();

  @override
  Future<List<int>?> selectPhoto() async {
    final XFile? imageData =
        await picker.pickImage(source: ImageSource.gallery);

    if (imageData == null) return null;

    final compressedImage = await FlutterImageCompress.compressWithFile(
      imageData.path,
      quality: 1,
      format: imageData.name.contains('.png') ? CompressFormat.png : CompressFormat.jpeg
    );

    return compressedImage;
  }

  @override
  Future<List<int>?> takePhoto() async {
    final XFile? imageData = await picker.pickImage(source: ImageSource.camera);

    if (imageData == null) return null;

    final compressedImage = await FlutterImageCompress.compressWithFile(
      imageData.path,
      quality: 1,
    );

    return compressedImage;
  }
}
