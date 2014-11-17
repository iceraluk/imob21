class Client < ActiveRecord::Base
    attr_accessible :titlu,
                    :tip_cerere,
                    :judet,
                    :oras,
                    :cartier,
                    :zone,
                    :tip_proprietate,
                    :data_limita
  
end
