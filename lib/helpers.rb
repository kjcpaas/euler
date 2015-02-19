require "benchmark"

def benchmark_solution(expected_answer)
  time_taken = Benchmark.realtime do
    answer = yield
    check_answer(answer, expected_answer)
  end

  p "Time taken: #{time_taken} seconds"
  p time_taken < 60 ? "Benchmark PASSED!" : "Benchmark FAILED!"
  p ""
end

def check_answer(answer, expected_answer)
  strings = [ "My Answer: #{answer}" ]
  if expected_answer
    strings << "Correct Answer: #{expected_answer}"
    strings << "#{ expected_answer == answer ? 'Correct' : 'Wrong' }!"
  end
  p strings.join(" | ")
end

def show_problem_info(info)
  p "======================================================"
  p "  Problem ##{info[:number]}"
  p "  #{info[:title]}"
  p "======================================================"
end
