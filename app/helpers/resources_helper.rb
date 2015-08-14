module ResourcesHelper
  def global_head1
    resources=Resource.where(:kind=>Resource::GLOBAL_HEADER).where(:check => true).order(:created_at=>:desc)
    if resources.count>=1
      image_tag resources.first.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    else
      image_tag 'Page1.jpg'
    end
  end

  def global_head2
    resources = Resource.where(:kind=>Resource::GLOBAL_HEADER).where(:check => true).order(:created_at=>:desc)
    if resources.count>=2
      image_tag resources.second.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    else
      image_tag 'Page2.jpg'
    end
  end

  def global_head3
    resources = Resource.where(:kind=>Resource::GLOBAL_HEADER).where(:check => true).order(:created_at=>:desc)
    if resources.count>=3
      image_tag resources.third.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    else
      image_tag 'Page3.jpg'
    end
  end

  def global_head4
    resources = Resource.where(:kind=>Resource::GLOBAL_HEADER).where(:check => true).order(:created_at=>:desc)
    if resources.count>=4
      image_tag resources.third.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    else
      image_tag 'Page4.jpg'
    end
  end

  def product_entire(product_id)
    product = Product.find(product_id)
    resources = Resource.where(:kind=>Resource::PRODUCT_ENTIRE).where(:product_id=>product_id).order(:created_at=>:desc)
    if resources.count>=1
      image_tag resources.first.path_url.to_s
    else
      image_tag product.image_url.to_s
    end
  end

  def product_partial1(product_id)
    resources = Resource.where(:kind=>Resource::PRODUCT_PARTIAL).where(:product_id=>product_id).order(:created_at=>:desc)
    if resources.count>=1
      image_tag resources.first.path_url.to_s
    else
      image_tag 'logo.png'
    end
  end

  def product_partial2(product_id)
    resources = Resource.where(:kind=>Resource::PRODUCT_PARTIAL).where(:check=>true).where(:product_id=>product_id).order(:created_at=>:desc)
    if resources.count>=2
      image_tag resource.second.path_url.to_s
    else
      image_tag 'logo.png'
    end
  end

  def product_partial3(product_id)
    resources = Resource.where(:kind=>Resource::PRODUCT_PARTIAL).where(:check=>true).where(:product_id=>product_id).order(:created_at=>:desc)
    if resources.count>=3
      image_tag resource.second.path_url.to_s
    else
      image_tag 'logo.png'
    end
  end

  def product_partial4(product_id)
    resources = Resource.where(:kind=>Resource::PRODUCT_PARTIAL).where(:check=>true).where(:product_id=>product_id).order(:created_at=>:desc)
    if resources.count>=4
      image_tag resource.second.path_url.to_s
    else
      image_tag 'logo.png'
    end
  end


  def global_body
  end

  def global_footer
    resources=Resource.where(:kind=>Resource::GLOBAL_FOOTER).where(:check => true).order(:created_at=>:desc)
    if resources.count>=1
      image_tag resources.first.path_url.to_s,:size=>'1600x440'
    else
      image_tag 'workshop_1.jpg'
    end
  end


end
