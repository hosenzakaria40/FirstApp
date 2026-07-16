class Urls {
  static String baseURL = 'https://crud-api-ostad-live.onrender.com/api/v1';
  static String readProductURL = '$baseURL/ReadProduct';
  static String createProductURL = '$baseURL/CreateProduct';
  static String deleteProductURL(String productID) => '$baseURL/DeleteProduct/$productID';
  static String updateProductURL(String productID) => '$baseURL/UpdateProduct/$productID';

}