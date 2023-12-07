import 'package:dicoding_news_app/src/news_app/features/news/detail_page.dart';
import 'package:flutter/material.dart';

import '../../repository/article/article.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News App"),),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/json/articles.json"),
        builder: (context,snapshot){
          final List<Article> articles = parseArticle(snapshot.data);
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
            return _buildArticleItem(context, articles[index]);
          });
        },
      )
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      article.urlToImage,
      width: 100,
      errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: (){
      Navigator.pushNamed(context, ArticleDetailPage.routeName, arguments: article);

    },
  );
}
