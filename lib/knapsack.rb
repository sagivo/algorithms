#taken from http://rosettacode.org/wiki/Knapsack_problem/0-1#Ruby using dynamic programming 
KnapsackItem = Struct.new(:name, :cost, :value)
KnapsackProblem = Struct.new(:items, :max_cost)
 
def dynamic_programming_knapsack(problem)
  num_items = problem.items.size
  items = problem.items
  max_cost = problem.max_cost
 
  cost_matrix = zeros(num_items, max_cost+1)
 
  num_items.times do |i|
    (max_cost + 1).times do |j|
      if(items[i].cost > j)
        cost_matrix[i][j] = cost_matrix[i-1][j]
      else
        cost_matrix[i][j] = [cost_matrix[i-1][j], items[i].value + cost_matrix[i-1][j-items[i].cost]].max
      end
    end
  end
 
  cost_matrix
end
 
def get_used_items(problem, cost_matrix)
  i = cost_matrix.size - 1
  currentCost = cost_matrix[0].size - 1
  marked = Array.new(cost_matrix.size, 0) 
 
  while(i >= 0 && currentCost >= 0)
    if(i == 0 && cost_matrix[i][currentCost] > 0 ) || (cost_matrix[i][currentCost] != cost_matrix[i-1][currentCost])
      marked[i] = 1
      currentCost -= problem.items[i].cost
    end
    i -= 1
  end
  marked
end
 
def get_list_of_used_items_names(problem, cost_matrix)
  items = problem.items
  used_items = get_used_items(problem, cost_matrix)
 
  result = []
 
  used_items.each_with_index do |item,i|
    if item > 0
      result << items[i].name
    end
  end
 
  result.sort.join(', ')
end
 
def zeros(rows, cols)
  Array.new(rows) do |row|
    Array.new(cols, 0)
  end
end
 
if $0 == __FILE__
 
    items = [
      KnapsackItem.new('map'                    , 9   , 150) , KnapsackItem.new('compass'             , 13  , 35)  , 
      KnapsackItem.new('water'                  , 153 , 200) , KnapsackItem.new('sandwich'            , 50  , 160) , 
      KnapsackItem.new('glucose'                , 15  , 60)  , KnapsackItem.new('tin'                 , 68  , 45)  , 
      KnapsackItem.new('banana'                 , 27  , 60)  , KnapsackItem.new('apple'               , 39  , 40)  , 
      KnapsackItem.new('cheese'                 , 23  , 30)  , KnapsackItem.new('beer'                , 52  , 10)  , 
      KnapsackItem.new('suntan cream'           , 11  , 70)  , KnapsackItem.new('camera'              , 32  , 30)  , 
      KnapsackItem.new('t-shirt'                , 24  , 15)  , KnapsackItem.new('trousers'            , 48  , 10)  , 
      KnapsackItem.new('umbrella'               , 73  , 40)  , KnapsackItem.new('waterproof trousers' , 42  , 70)  , 
      KnapsackItem.new('waterproof overclothes' , 43  , 75)  , KnapsackItem.new('note-case'           , 22  , 80)  , 
      KnapsackItem.new('sunglasses'             , 7   , 20)  , KnapsackItem.new('towel'               , 18  , 12)  , 
      KnapsackItem.new('socks'                  , 4   , 50)  , KnapsackItem.new('book'                , 30  , 10)
    ]
 
  problem = KnapsackProblem.new(items, 400)
 
  cost_matrix = dynamic_programming_knapsack problem
  puts
  puts 'Dynamic Programming:'
  puts
  puts 'Found solution: ' + get_list_of_used_items_names(problem, cost_matrix)
  puts 'With value: ' + cost_matrix.last.last.to_s
end