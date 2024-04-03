class GroceryData {
  static String image1 =
      "https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bunch-of-bananas-67e91d5.jpg?quality=90&webp=true&resize=440,400";
  static String image2 =
      "https://domf5oio6qrcr.cloudfront.net/medialibrary/11525/0a5ae820-7051-4495-bcca-61bf02897472.jpg";
  static String image3 =
      "https://cdn.britannica.com/77/200377-050-4326767F/milk-splashing-glass.jpg";
  static String image4 =
      "https://upload.wikimedia.org/wikipedia/commons/3/33/Fresh_made_bread_05.jpg";
  static String image5 =
      "https://media.post.rvohealth.io/wp-content/uploads/2020/09/health-benefits-of-eggs-732x549-thumbnail-732x549.jpg";

  static List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Apples',
      'description': 'Fresh, juicy apples',
      'price': 2.99,
      'quantity': 10,
      'image': image2,
    },
    {
      'id': 2,
      'name': 'Bananas',
      'description': 'Ripe bananas',
      'price': 1.99,
      'quantity': 15,
      'image': image1,
    },
    {
      'id': 3,
      'name': 'Milk',
      'description': '1 gallon of whole milk',
      'price': 3.49,
      'quantity': 8,
      'image': image3,
    },
    {
      'id': 4,
      'name': 'Bread',
      'description': 'Freshly baked bread loaf',
      'price': 2.29,
      'quantity': 5,
      'image': image4,
    },
    {
      'id': 5,
      'name': 'Eggs',
      'description': 'Dozen farm-fresh eggs',
      'price': 2.79,
      'quantity': 12,
      'image': image5,
    },
    // Add more items as needed
  ];
}
