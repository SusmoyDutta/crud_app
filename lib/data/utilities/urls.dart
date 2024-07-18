class Urls{
  static const _baseUrls = 'https://crud.teamrabbil.com/api/v1';
  static const readProduct = '$_baseUrls/ReadProduct';
  static const createProduct = '$_baseUrls/CreateProduct';
  static String updateProduct(String id) => '$_baseUrls/UpdateProduct/$id';
  static String deleteProduct(String id) => '$_baseUrls/DeleteProduct/$id';

}