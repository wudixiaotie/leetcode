# https://oj.leetcode.com/problems/text-justification/

# Given an array of words and a length L, format the text such that each line has exactly L characters and is fully (left and right) justified.

# You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly L characters.

# Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

# For the last line of text, it should be left justified and no extra space is inserted between words.

# For example,
# words: ["This", "is", "an", "example", "of", "text", "justification."]
# L: 16.

# Return the formatted lines as:
# [
#    "This    is    an",
#    "example  of text",
#    "justification.  "
# ]
# Note: Each word is guaranteed not to exceed L in length.

words = ["This", "is", "an", "example", "of", "text", "justification."]
L = 16

def full_justify(words, max_length)
  result, cur_item_arr = [], []

  def result.justify(cur_item_arr)
    i = 0
    while true
      i = 0 if i >= cur_item_arr.length - 1
      cur_item_arr[i] += ' '
      break if cur_item_arr.join(' ').length >= L
      i += 1
    end

    self << cur_item_arr.join(' ')
  end

  words.each_with_index do |word, index|
    cur_item_arr << word

    if cur_item_arr.join(' ').length >= max_length
      cur_item_arr.delete_at(cur_item_arr.length - 1)
      result.justify(cur_item_arr)
      cur_item_arr = []
      redo
    end

    if index == words.length - 1
      result.justify(cur_item_arr)
    end
  end

  result
end

p full_justify(words, L)