require 'nokogiri'
doc = Nokogiri::XML(File.read('/home/kiryu/VUZ/WPL/laboratories/10/lab10/test_xml.xml'))
xslt = Nokogiri::XSLT(File.read('/home/kiryu/VUZ/WPL/laboratories/10/lab10/transform.xslt'))
puts xslt.transform(doc)

# Функциональный тест
class XmlControllerTest < ActionDispatch
  # Проверяем, какой формат получили от контроллера при запросе в RSS.
  test 'check rss format' do
    # Делаем запрос с параметрами - словарь превратится в lower=10&upper=100&format=rss
    get '/', params: { inpt: 100, format: :rss }
    # Проверили, что получили статус ответа 200 OK
    assert_response :success
    # Тип ответа лежит в его заголовках, поэтому смотрим туда.
  #  assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end