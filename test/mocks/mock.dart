import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';
import 'package:store_app_devnology/app/core/product/domain/repositories/product_repository_interface.dart';
import 'package:store_app_devnology/app/core/product/infra/datasources/product_datasource_interface.dart';

class IProductRepositoryMock extends Mock implements IProductRepository {}

class IProductDataSourceMock extends Mock implements IProductDataSource {}

final productEntityMcok = ProductEntity(price: 200, title: 'Lenovo', uid: '01');

final listProductEntityMock = [productEntityMcok];

final productMapMock = {
  "uid": "01",
  "short_title": "Lenovo - IdeaPad L340 15 Gaming",
  "image": [
    "assets/items_photos/lenovo_idealpad/lenovo1.png",
    "assets/items_photos/lenovo_idealpad/lenovo2.png",
    "assets/items_photos/lenovo_idealpad/lenovo3.png",
  ],
  "price": 717.80,
  "itemInCart": 1,
  "title":
      "Notebook Gamer Lenovo Ideapad L340, Processador Intel Core I5 8gb 256gb Ssd Tela 15.6, Preto",
  "description": """
1.8 GHz Intel Core i7-10510U Quad-Core Processor
16GB of DDR4 RAM | 512GB SSD
15.6" 1920 x 1080 IPS Display
NVIDIA Quadro P520
Windows 10 Pro 64-Bit Edition
1.8 GHz Intel Core i7-10510U Quad-Core Processor
16GB of DDR4 RAM | 512GB SSD
15.6" 1920 x 1080 IPS Display
NVIDIA Quadro P520
""",
};

List<Map<String, dynamic>> listProductTestMock = [
  {
    "uid": "01",
    "short_title": "Lenovo - IdeaPad L340 15 Gaming",
    "image": [
      "assets/items_photos/lenovo_idealpad/lenovo1.png",
      "assets/items_photos/lenovo_idealpad/lenovo2.png",
      "assets/items_photos/lenovo_idealpad/lenovo3.png",
    ],
    "price": 717.80,
    "itemInCart": 1,
    "title":
        "Notebook Gamer Lenovo Ideapad L340, Processador Intel Core I5 8gb 256gb Ssd Tela 15.6, Preto",
    "description": """
1.8 GHz Intel Core i7-10510U Quad-Core Processor
16GB of DDR4 RAM | 512GB SSD
15.6" 1920 x 1080 IPS Display
NVIDIA Quadro P520
Windows 10 Pro 64-Bit Edition
1.8 GHz Intel Core i7-10510U Quad-Core Processor
16GB of DDR4 RAM | 512GB SSD
15.6" 1920 x 1080 IPS Display
NVIDIA Quadro P520
""",
  },
  {
    "uid": "02",
    "short_title": "Lenovo 15.6\" ThinkPad P15s Gen 1",
    "image": [
      "assets/items_photos/lenovo_thinkpad/lenovo1.png",
      "assets/items_photos/lenovo_thinkpad/lenovo2.png",
      "assets/items_photos/lenovo_thinkpad/lenovo3.png",
    ],
    "price": 1519.99,
    "itemInCart": 1,
    "title":
        "Lenovo 15.6\" ThinkPad P15s Gen 1 Laptop, Intel Core i7-10510U Quad-Core, 16GB DDR4 RAM, 512GB SSD, NVIDIA Quadro P520, Windows 10 Pro (20T4001VUS)",
    "description": "",
  },
  {
    "uid": "03",
    "short_title": "Notebook Lenovo 2 em 1",
    "image": [
      "assets/items_photos/lenovo/lenovo.png",
    ],
    "price": 4699.00,
    "itemInCart": 0,
    "title":
        "Notebook Gamer Lenovo Ideapad L340, Processador Intel Core I5 8gb 256gb Ssd Tela 15.6, Preto",
    "description": "",
  },
];
