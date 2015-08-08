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
