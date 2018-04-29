# @param {String} path
# @return {String}
def simplify_path(path)
  dirs = path.split("/")
  stack = []

  dirs.each do |dir|
    next if dir.empty? || dir == "."
    if dir == ".."
        stack.pop unless stack.empty?
    else
        stack.push(dir)
    end
  end

  "/" + stack.join("/")
end

p simplify_path("/a/./b/../../c/") # => "/c"
