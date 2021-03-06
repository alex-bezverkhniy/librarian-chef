require "librarian/environment"
require "librarian/chef/dsl"
require "librarian/chef/source"
require "librarian/chef/version"

module Librarian
  module Chef
    class Environment < Environment

      def adapter_name
        "chef"
      end

      def adapter_version
        VERSION
      end

      def install_path
        part = config_db["path"] || "cookbooks"
        project_path.join(part)
      end

      def config_keys
        super + %w[
          install.strip-dot-git
          path
        ]
      end

    end
  end
end
