module Refinery
  module Entitlements
    class Entitlement < Refinery::Core::BaseModel
      self.table_name = 'refinery_entitlements'


      validates :rank, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
