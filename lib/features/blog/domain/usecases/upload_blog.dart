import 'dart:io';

import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/blog.dart';

class UploadBlog implements Usecase<Blog, UploadBlogParms> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParms parms) async {
    return await blogRepository.uploadBlog(
      image: parms.image,
      title: parms.title,
      content: parms.content,
      posterId: parms.posterId,
      topics: parms.topics,
    );
  }
}

class UploadBlogParms {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParms({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
