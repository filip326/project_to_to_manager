class User {
  const User({
    required this.name,
    required this.discordUrl,
  });
  final String name;
  final String discordUrl;
}

class GitHub {
  const GitHub({
    required this.repoName,
    required this.url,
  });
  final String url;
  final String repoName;
}

class Link {
  const Link({
    required this.url,
    required this.text,
  });
  final String url;
  final String text;
}
