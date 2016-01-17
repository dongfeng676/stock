module Admin::OrderHelper
  def order_state
    [["请选择",""],["不可用",-1],["已生效",0],["送货中",1],["已完成",2],["已取消",3]]
  end

  def order_state_show(state)
    state_show = "暂无"
    case state
    when -1
      state_show = "不可用"
    when 0
      state_show = "已生效"
    when 1
      state_show = "送货中"
    when 2
      state_show = "已完成"
    when 3
      state_show = "已取消"
    end
    state_show
  end

end