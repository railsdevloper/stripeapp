class WebsiteValidator < ActiveModel::EachValidator
  
  def validate_each(object, attribute, value)
    return unless value.present?
    reserved_names = %w(www ftp mail pop smtp admin ssl sftp)
    reserved_names = options[:reserved] if options[:reserved]
    if reserved_names.include?(value)
      object.errors[attribute] << 'cannot be a reserved name'
    end                                              
    object.errors[attribute] << 'must have between 4 and 32 letters' unless (4..32) === value.length
    object.errors[attribute] << 'cannot start or end with a hyphen' unless value =~ /^[^-].*[^-]$/i                                                                                                    
    object.errors[attribute] << 'can only contain letters, numbers, and hyphens' unless value =~ /^[a-z0-9\-]*$/i
  end
end

