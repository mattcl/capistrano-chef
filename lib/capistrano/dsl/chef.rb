module Capistrano
  module DSL
    module Chef
      def chef_config(file)
        ::Chef::Config.from_file(file)
      end

      def chef_search(query)
        # TODO: generalize for any attribute
        resp = ::Chef::Search::Query.new.search(:node, query)
        resp.first.collect { |node| node['ipaddress'] }
      end
    end
  end
end
