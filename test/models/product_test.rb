require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test for the product model
  fixtures :products

  test "new product must not be saved" do
    product = Product.new
    assert !product.save
  end
  test "product attributes must not be empty" do
    product = Product.new
    assert !product.valid?
    assert !product[:title]
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title:
                              "My Book Title",
                          description: "yyy XXX zzzz",
                          image_url:
                              "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                 product.errors[:price].join('; ')
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                 product.errors[:price].join('; ')
    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title:   "My Book Title",
                description: "yyy",
                price:         1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "uniqueness of the product name" do
    product_one = Product.new(title:   "My Book Title",
                          description: "yyy",
                          price:         1,
                          image_url: "xxx.jpg")
    assert product_one.save

    product_two = Product.new(title:   "My Book Title",
                          description: "yyy",
                          price:         1,
                          image_url: "xxx.jpg")
    assert !product_two.save
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
                          description: "Wibbles are fun!",
                          price: 9.95,
                          image_url: "uvw.png")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join(';')
  end

  test "title is at least 10 characters long" do
    product = Product.new(:price        =>  9.99,
                          :description  =>  "yyy",
                          :image_url    =>  "zzz.jpg")

    product.title = "This is an acceptable title"
    assert product.valid?

    product.title = "not this"
    assert product.invalid?
    assert_equal "is too short (minimum is 10 characters)",
                 product.errors[:title].join('; ')
  end
end
