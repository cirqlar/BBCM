module SessionsHelper

  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_admin.nil?
  end

  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  def logged_in_admin
    unless logged_in?
      flash[:danger] = "You do not have permission to acces this page."
      redirect_to root_path
    end
  end

  def correct_admin
    @admin = Admin.find(params[:id])
    unless @admin == current_admin || @admin.ancestor_ids.include?(session[:admin_id])
      flash[:danger] = "You do not have permission to acces this page."
      redirect_to root_path
    end
  end
end
