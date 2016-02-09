class Comment < ActiveRecord::Base
  belongs_to :indicador
  belongs_to :proceso
  belongs_to :user
end
