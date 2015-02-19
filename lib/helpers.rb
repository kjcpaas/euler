require "benchmark"

def benchmark_solution(expected_answer)
  time_taken = Benchmark.realtime do
    answer = yield
    check_answer(answer, expected_answer)
  end

  p "Time taken: #{time_taken} seconds"
end

def check_answer(answer, expected_answer)
  p "Your answer is #{answer}"
  if expected_answer
    p "Answer should be: #{expected_answer}"
    p "#{ expected_answer == answer ? 'Correct' : 'Wrong' }!"
  end
end
