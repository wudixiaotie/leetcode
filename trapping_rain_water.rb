a = [0,1,0,2,1,0,1,3,2,1,2,1]
b = [0,0,0,0,0,7,0,0,0,0,0,0]
# https://oj.leetcode.com/problems/trapping-rain-water/
def trap(data_arr)
  total_trap = 0

  data_arr.each_with_index do |item, index|
    left_edge, right_edge = item, item
    # find left bigest edge
    (0..(index - 1)).reverse_each do |left_index|
      left_item = data_arr[left_index]
      if left_item > left_edge
        left_edge = left_item
      end
    end

    # find right bigest edge
    ((index + 1)..(data_arr.length - 1)).each do |right_index|
      right_item = data_arr[right_index]
      if right_item > right_edge
        right_edge = right_item
      end
    end

    # this point traped water
    increment = left_edge >= right_edge ? right_edge - item : left_edge - item

    # puts "index:#{index} left_edge:#{left_edge} right_edge:#{right_edge} increment:#{increment}"
    total_trap += increment
  end

  total_trap
end

p trap(a) == 6
p trap(b) == 0