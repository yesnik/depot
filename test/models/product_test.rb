# encoding: utf-8
require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  # Определяем, какую из фикстур загружать для теста
  # Это будет: test/fixtures/products.yml
  # fixtures :products  - Rails загрузит это по умолчанию

  # Свойства товара не должны быть пустыми
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  # Цена товара должна быть положительной
  test 'product price must be positive' do
    product = Product.new(
      title: 'My Super Book', 
      description: 'Some book description',
      image_url: 'MovieFilm-DVD.jpg' 
      )
    product.price = -1
    assert product.invalid?
    assert_equal I18n.t('activerecord.errors.messages.greater_than_or_equal_to'),
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal I18n.t('activerecord.errors.messages.greater_than_or_equal_to'),
      product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  # Вспомогательный метод для создания экземпляра продукта
  def new_product(image_url)
    Product.new(
      title: 'My Sup Book', description: 'aaa bbb ccc ddd aaa', 
      price: 10.11, image_url: image_url)
  end

  # URL изображения должно иметь корректное расширение
  test 'image_url' do
    ok = %w{ fred.gif fred.jpg fred.png http://site.com/book.JPG aa.Png }
    ok.each do |name|
      assert new_product(name).valid?, "#{ name } - должен быть корректен"
    end

    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    bad.each do |name|
      assert new_product(name).invalid?, "#{ name } - НЕ должен быть корректен"
    end
  end

  # Имя товара должно быть уникальным
  test 'product is not valid without a unique title - i18n' do
    # Пробуем создать товар с существующим заголовком
    product = Product.new(
      title: products(:ruby_book).title,
      description: 'bbb',
      price: 2,
      image_url: 'dolly.gif')
    assert_not product.save
    assert_equal I18n.t('errors.messages.taken'),
      product.errors[:title].join('; ')
  end
end
