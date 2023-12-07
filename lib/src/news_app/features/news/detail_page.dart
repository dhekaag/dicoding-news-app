import 'package:dicoding_news_app/src/news_app/repository/article/article.dart';
import 'package:flutter/material.dart';

import 'article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, required this.article});

  static const routeName = '/article_detail';
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text("Date: ${article.publishedAt}"),
                  SizedBox(height: 10),
                  Text("Author: ${article.author}"),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, ArticleWebView.routeName,
                            arguments: article.url);
                      },
                      child: Text("Read more")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
