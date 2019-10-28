module TestPassagesHelper

  def time_format(time)
    minutes = "0" + time.floor.to_i.to_s
    seconds = "0" + ((time - time.floor) * 100).to_i.to_s
    minutes[-2, 2] + ":" + seconds[-2, 2]
  end

end
