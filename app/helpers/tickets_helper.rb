module TicketsHelper
  def build_hash_tree(collection, options={}, result={})
    result = Array.wrap result
    collection = Array.wrap collection

    opts = {
        node:     nil, # node
        parent:   :parent_id, # parent id
        boost:    [] # BOOST! array

    }.merge!(options)

    node = opts[:node]

    if opts[:boost].empty?
      collection.each do |i|
        num = i.ticketable_id || 0
        opts[:boost][num] = [] unless opts[:boost][num]
        opts[:boost][num].push i
      end
    end

    if node
      children_res = ''
      children = opts[:boost][node.id]
      opts.merge!({has_children: children.blank?})

      unless children.nil?
        children.each do |elem|
          _opts = opts.merge({node: elem, boost: opts[:boost]})
          children_res << build_hash_tree(collection, _opts)
        end
      end

      _opts = opts.merge({nodes: node, :children => children_res})
      result << build_hash_tree(self, _opts, result)
    end
    result
  end
end

