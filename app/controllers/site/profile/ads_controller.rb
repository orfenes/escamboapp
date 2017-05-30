class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.to_then(current_member.id)
  end

  def edit
    #
  end

  def update
    #
  end
end
