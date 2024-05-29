import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';
import 'package:trial_feature/features/Domain/articles_response.dart';

class ArticleRepository {
  const ArticleRepository();

  Future<List<Article>> getArticles() async {
    final response = await rootBundle.loadString("assets/data.json");
    final data = ArticlesResponse.fromJson(jsonDecode(response));
    return data.articles;
  }

  Future<Article> getOneArticle(int index) async {
    final response = await rootBundle.loadString('assets/data.json');
    final data = ArticlesResponse.fromJson(jsonDecode(response));
    final article = data.articles[index];
    return article;
  }

  Future<List<Article>> getSortedArticles() async {
    final response = await rootBundle.loadString("assets/data.json");
    final data = ArticlesResponse.fromJson(jsonDecode(response));
    final articles = data.articles.toList();
    articles.sort((a, b) {
      return priorityOrder[a.priority]!.compareTo(priorityOrder[b.priority]!);
    });
    return articles;
  }
}

const priorityOrder = {'very high': 0, 'high': 1, 'medium': 2, 'low': 3};
