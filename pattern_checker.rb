module PatternChecker
  # Checks if number or string is a palindrome
  def palindrome?
    self.to_s == self.to_s.reverse
  end

  # Checks if number or string is pandigital
  def pandigital?
    self.to_s.length == 9 and self.to_s.gsub("0", "").split("").uniq.length == 9
  end

  def n_pandigital?(n = 9)
    if n == 10
      self.to_s.length == n and self.to_s.split("").uniq.length == n
    else
      self.to_s.length == n and self.to_s.gsub("0", "").split("").uniq.length == n
    end
  end

  def perms?(other)
    self.to_s.split("").sort == other.to_s.split("").sort
  end
end