

const String productTableName = 'Product';
const String sqlProductTable = '''
      CREATE TABLE Product (
      id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT,
      brand TEXT,
      category TEXT,
      thumbnail TEXT,
      images TEXT,
      price REAL,
      discountPercentage REAL,
      rating REAL,
      stock INTEGER,
      )''';