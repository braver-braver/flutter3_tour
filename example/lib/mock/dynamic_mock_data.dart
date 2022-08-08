class DynamicMockData {
  static List<Map<String, Object>> list(int page, int size) {
    return List<Map<String, Object>>.generate(
        size,
        (index) => {
              'title':
                  '标题${index + (page - 1) * size + 1}: 这是一个标题列表，最多两行，多出的部分会被截取',
              'imageUrl':
                  'https://img1.baidu.com/it/u=2930250383,3948884618&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=710',
              'viewCount': 180,
            });
  }
}
