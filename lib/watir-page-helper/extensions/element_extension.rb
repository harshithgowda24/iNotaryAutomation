module Watir
  class Element
    def sibling type, selector = {}
      parent.send(type, selector)
    end
  end
end
