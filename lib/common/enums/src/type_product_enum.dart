enum ProductTypeEnum {
  post(value: "post", name: "Product Post"),
  request(value: "request", name: "Product Service"),
  service(value: "service", name: "Product Request");

  const ProductTypeEnum({
    required this.value,
    required this.name,
  });
  final String value;
  final String name;
}

class ProductTypeEnumHelper {
  static ProductTypeEnum getEnumValue(String? value) {
    if (value == ProductTypeEnum.post.value) {
      return ProductTypeEnum.post;
    } else if (value == ProductTypeEnum.request.value) {
      return ProductTypeEnum.request;
    } else if (value == ProductTypeEnum.service.value) {
      return ProductTypeEnum.service;
    } else {
      return ProductTypeEnum.post;
    }
  }
}
