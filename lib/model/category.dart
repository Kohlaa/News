class Category1 {
  String id;
  String title;
  String imagePath;
  int color;

  Category1(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<Category1> getCategories() {
    //business entertainment general health science sports technology
    return [
      Category1(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          color: 0xffc91c22),
      Category1(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/business.png',
          color: 0xffCF7E48),
      Category1(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: 0xff4882CF),
      Category1(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color:0xffED1E79 ),
      Category1(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: 0xffF2D352),
      Category1(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/science.png',
          color: 0xff003E90),
      Category1(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/Logo.png',
          color: 0xffF2D352),
    ];
  }
}
// git remote add origin git@github.com:Kohlaa/tatatatt.git
// git branch -M main
// git push -u origin main