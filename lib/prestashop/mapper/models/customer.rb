using Prestashop::Mapper::Refinement
module Prestashop
  module Mapper
    class Customer < Model
      resource :customers
      model :customer
      
      attr_accessor :id_lang
      attr_accessor :id, :first_name, :last_name, :note, :email

      def initialize args = {}
        @id              = args[:id]
        @first_name      = args[:first_name]
        @email           = args[:email]
        @last_name       = args[:last_name]
        @note            = args[:note]
        @id_lang         = args.fetch(:id_lang)
      end

      def hash
        {
          id_shop:    id_shop_default,
          first_name: hash_lang(first_name, id_lang),
          last_name:  hash_lang(last_name, id_lang),
          email:      hash_lang(email, id_lang),
          note:       hash_lang(note, id_lang)
        }
      end
      
    end
  end
end
