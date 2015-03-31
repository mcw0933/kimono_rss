module KimonoLabsClient
  # General utilities class
  class Utils
    # Provides a method for diffing POROs
    def self.diff(prev, curr)
      diff = (prev.blank? || curr.blank? || prev.instance_variables.length != curr.instance_variables.length)

      prev.instance_variables.each { |p| diff ||= (prev.send(p) != curr.send(p)) } unless diff

      diff
    end
  end
end
