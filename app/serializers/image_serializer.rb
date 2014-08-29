class ImageSerializer < ActiveModel::Serializer
  attributes :id, :original_filename, :uploaded_filename, :title
end
