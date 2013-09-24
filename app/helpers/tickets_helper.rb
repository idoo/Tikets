module TicketsHelper
  def build_hash_tree(tree, options={}, result=[])
    result = []

    opts = {
      node:      nil,        # node
      parent_id: :parent_id, # parent id
      boost:     []          # BOOST! array
    }.merge!(options)

    node      = opts[:node]
    parent_id = opts[:parent_id].to_sym

    if opts[:boost].empty?
      tree.each do |node|
        num = node[parent_id] || 0
        opts[:boost][num] = [] unless opts[:boost][num]
        opts[:boost][num].push node
      end
    end

    if !node
      roots = opts[:boost][0]

      # define roots, if it's need
      if roots.nil? && !tree.empty?
        min_parent_id = tree.map(parent_id).compact.min
        roots = tree.select{ |elem| elem[parent_id] == min_parent_id }
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
      children = opts[:boost][node.id] || []
      result.push({node: node, children: children })
    end

    result
  end
end

