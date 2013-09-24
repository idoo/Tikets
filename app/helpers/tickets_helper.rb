module TicketsHelper
  def get_tree_children tree, opts={}
    node  = opts[:node]
    boost = opts[:boost]
    children = boost[node.id]
  end

  def build_hash_tree(tree, options={}, result=[])
    result = Array.wrap result
    tree   = Array.wrap tree

    opts = {
      node:      nil, # node
      parent_id: :parent_id, # parent id
      boost:     [] # BOOST! array
    }.merge!(options)

    node = opts[:node]

    if opts[:boost].empty?
      tree.each do |i|
        num = i.ticketable_id || 0
        opts[:boost][num] = [] unless opts[:boost][num]
        opts[:boost][num].push i
      end
    end

    if !node
      roots = opts[:boost][0]

      # define roots, if it's need
      if roots.nil? && !tree.empty?
        min_parent_id = tree.map(opts[:parent].to_sym).compact.min
        roots = tree.select{ |elem| elem[opts[:parent_id]] == min_parent_id }
      end

      # children rendering
      if roots
        roots.each do |root|
          _opts = opts.merge({ node: root, boost: opts[:boost] })
          result.push build_hash_tree(tree, _opts)
        end
      end
    else
      # children rendering
      children_res = []
      children = opts[:boost][node.id]

      unless children.nil?
        children.each do |elem|
          # _opts = opts.merge({node: elem, boost: opts[:boost]})
          children_res.push children #get_tree_children(children)
        end
      end

      result.push children_res
      # _opts = opts.merge({nodes: node, :children => children_res})
      # result.push build_hash_tree(self, _opts, result)
    end

    result
  end
end

