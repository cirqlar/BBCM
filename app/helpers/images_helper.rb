module ImagesHelper

  def index_images(images)
    images.map { |image| render('img', image: image) }.join.html_safe
  end
end
