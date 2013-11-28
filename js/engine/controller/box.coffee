define ['engine/controller/item', 'engine/view/box'], (ItemController, BoxView) ->
    class BoxController extends ItemController
        view_class: BoxView
