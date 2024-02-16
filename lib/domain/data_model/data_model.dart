class MenuItem {
  final String name;
  final String sliderTitle;
  final String sliderDesc;
  final bool isActive;
  final String sliderImage;
  final List<Product> products;

  MenuItem({
    required this.name,
    required this.sliderTitle,
    required this.sliderDesc,
    required this.isActive,
    required this.sliderImage,
    required this.products,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      sliderTitle: json['slider_title'],
      sliderDesc: json['slider_desc'],
      isActive: json['is_active'] == '1',
      sliderImage: json['slider_image'],
      products: (json['products'] as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String desc;
  final String amount;
  final String productType;
  final bool isActive;
  final String image;
  final String currency;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.amount,
    required this.productType,
    required this.isActive,
    required this.image,
    required this.currency,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      amount: json['amount'],
      productType: json['product_type'],
      isActive: json['is_active'] == '1',
      image: json['image'],
      currency: json['currency'],
    );
  }
}

class WebsiteDetails {
  final String id;
  final String restaurantId;
  final String eventId;
  final String aboutUs;
  final String sliderTitle;
  final String sliderDesc;
  final String phone;
  final String mobile;
  final String email;
  final String address;
  final String copyright;
  final String facebookLink;
  final String instagramLink;
  final String twitterLink;
  final String pinterestLink;
  final String linkedinLink;
  final String image;
  final bool isPdfMenu;
  final String pdfMenu;

  WebsiteDetails({
    required this.id,
    required this.restaurantId,
    required this.eventId,
    required this.aboutUs,
    required this.sliderTitle,
    required this.sliderDesc,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.address,
    required this.copyright,
    required this.facebookLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.pinterestLink,
    required this.linkedinLink,
    required this.image,
    required this.isPdfMenu,
    required this.pdfMenu,
  });

  factory WebsiteDetails.fromJson(Map<String, dynamic> json) {
    return WebsiteDetails(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      eventId: json['event_id'],
      aboutUs: json['about_us'],
      sliderTitle: json['slider_title'],
      sliderDesc: json['slider_desc'],
      phone: json['phone'],
      mobile: json['mobile'],
      email: json['email'],
      address: json['address'],
      copyright: json['copyright'],
      facebookLink: json['facebook_link'],
      instagramLink: json['instagram_link'],
      twitterLink: json['twitter_link'],
      pinterestLink: json['pinterest_link'],
      linkedinLink: json['linkedin_link'],
      image: json['image'],
      isPdfMenu: json['is_pdf_menu'] == '1',
      pdfMenu: json['pdf_menu'],
    );
  }
}
