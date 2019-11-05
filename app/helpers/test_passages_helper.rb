module TestPassagesHelper

  def time_format(seconds_total)
    minutes = (seconds_total / 60).floor.to_i
    seconds = (seconds_total - minutes * 60).floor.to_i

    minutes = "0" + minutes.to_s
    seconds = "0" + seconds.to_s
    minutes[-2, 2] + ":" + seconds[-2, 2]
  end

  def elapsed_time(test_passage)
    time_format(test_passage.created_at + test_passage.test.time * 60 - Time.current)
  end

end
