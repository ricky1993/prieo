module ResourcesHelper
  def global_head1
    resources=Resource.where(:check => true).order(:created_at=>:desc)
    if resources.count>=1
      image_tag resources.first.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    else
      if Resource.all.count>0
        image_tag Resource.order(:created_at=>:desc).first.path_url.to_s,class: 'ui fluid image',size:'1600x440'
      end
    end
  end

  def global_head2
    resources = Resource.where(:check => true).order(:created_at=>:desc)
    if resources.count>=2
      image_tag resources.second.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    elsif resources.count>=1
      if Resource.where.(:check=>[false,nil]).count>=1
        image_tag Resource.where.(:check=>[false,nil]).first.path_url.to_s,class: 'ui fluid image',size:'1600x440'
      end
    end
  end

  def global_head3
    resources = Resource.where(:check => true).order(:created_at=>:desc)
    if resource.count>=3
      image_tag resource.third.path_url.to_s,class: 'ui fluid image',size:'1600x440'
    elsif resources.count ==2
      if Resource.where.(:check=>[false,nil]).count>=1
        image_tag Resource.where.(:check=>[false,nil]).first.path_url.to_s,class: 'ui fluid image',size:'1600x440'
      end
    elsif resources.count ==1
      if Resource.where.(:check=>[false,nil]).count>=2
        image_tag Resource.where.(:check=>[false,nil]).second.path_url.to_s,class: 'ui fluid image',size:'1600x440'
      end
    end
  end

  def global_body

  end

  def global_footer

  end


end
