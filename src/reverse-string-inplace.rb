# @param {String} s
# @return {String}
def reverse_string(s)
  return nil unless s
  return '' if s.empty?
  (0...s.size/2).each do |i|
    s[i], s[s.size - 1 - i] = s[s.size - 1 - i], s[i]
  end
  return s
end

p reverse_string('helwo')