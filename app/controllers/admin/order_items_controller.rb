module Admin
  class OrderItemsController < ApplicationController
    before_action(:authenticate_user!) if defined?(Devise)

    layout (EffectiveOrders.layout.kind_of?(Hash) ? EffectiveOrders.layout[:admin_orders] : EffectiveOrders.layout)

    def index
      if Gem::Version.new(EffectiveDatatables::VERSION) < Gem::Version.new('3.0')
        @datatable = Effective::Datatables::OrderItems.new()
      else
        @datatable = EffectiveOrderItemsDatatable.new(self)
      end

      @page_title = 'Order Items'

      EffectiveOrders.authorized?(self, :admin, :effective_orders)
      EffectiveOrders.authorized?(self, :index, Effective::OrderItem)
    end
  end
end
