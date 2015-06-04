module Capistrano
  module DSL
    module Chef
      def chef_config(path)
        @chef_config_path = path
      end

      def chef_search(query)
        # So we could use the chef gem directly for this, but that doesn't work
        # for projects running ruby < 2.0.0 without a lot of gem dependency
        # crap.
        knife_command =
          "knife search node '#{query}' -c #{@chef_config_path} -a ipaddress -F json"

        raw_response = nil
        Bundler.with_clean_env do
          raw_response = IO.popen(knife_command) { |io| io.read }
        end

        response = JSON.parse(raw_response)

        return [] if response['rows'].empty?

        # rows looks like
        # [
        #   {
        #     "node-name": {
        #       "ipaddress": "..."
        #     }
        #   },
        #   ...
        # ]

        response['rows'].collect { |node| node.values.first['ipaddress'] }
      end
    end
  end
end
