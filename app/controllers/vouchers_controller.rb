class VouchersController < ApplicationController
  before_action :authenticate_user!

  def user_vouchers
    unless params[:id] == current_user.id.to_s || current_user.admin
      redirect_to user_vouchers_path(current_user.id)
    end

    user = User.find(params[:id])
    @vouchers = user.vouchers.order(used_date: :asc)
  end

  def use_voucher
    if voucher.user != current_user
      return redirect_to user_vouchers_path(current_user)
    end

    voucher.update!(used_date: DateTime.current)

    redirect_to user_vouchers_path(current_user), notice: 'Bon został użyty.'
  end

  private

  def voucher
    @voucher ||= Voucher.find(params[:id])
  end

  def voucher_params
    params.permit(:used_date)
  end
end
