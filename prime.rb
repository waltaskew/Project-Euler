module Prime
  require 'generator'
  
  def Prime.is_prime? n
    if n < 2
      return false
    elsif n < 4 # 2 and 3 are prime
      return false
    elsif n % 2 == 0 # no even numbers except 2 are prime
      return false
    elsif n < 9 # already excluded 4, 6 and 8
      return true
    elsif n % 3 == 0 # already allowed 3
      return false
    else
      largest_factor = Math.sqrt(n).floor # the largest possible factor of n
      factor = 5 # already excluded 2, 3 and 4 as factors earlier
      while factor <= largest_factor
        if n % factor == 0
          return false
          ## all primes greater than 3 can be written in the form 6k+/-1
          ## and we only need to test primes as factors, so we can skip
          ## every third odd number when looking at possible factors
        elsif n % (factor + 2) == 0
          return false
        end
        factor += 6 
      end
      return true
    end
  end

  def Prime.iter_primes
    Generator.new do |result|
      result.yield 2
      result.yield 3
      candidate = 5
      while true
        if is_prime? candidate
          result.yield candidate
        end
        candidate += 2
        if is_prime? candidate
          result.yield candidate
        end
        candidate += 4
      end
    end
  end

  def Prime.nth_prime n
    n -= 1 # index is from 0
    iter_primes.each_with_index do |prime, count|
      if count >= n
        return prime
      end
    end
  end

  def Prime.iter_n_primes n
    Generator.new do |result|
      count = 0
      prime_gen = iter_primes
      while count < n
        result.yield prime_gen.next
        count += 1
      end
    end
  end
  
  def Prime.iter_primes_less_than n
    iter_primes.each do |prime|
      if prime >= n
        return
      else
        yield prime
      end
    end
  end

  # Build a sieve which filters out non-primes, and then
  # returns a list of primes less than @limit
  def Prime.primes_up_to limit
    cross_limit = (Math.sqrt(limit) - 1 / 2).floor
    ## create a sieve to represent odd numbers less than limit
    ## the value represented by an index is 2 * index + 1
    sieve_limit = (limit - 1) / 2 + 1 # last index of the sieve
    sieve = []
    sieve_limit.times do
      sieve << true
    end
    sieve[0] = false # mark 1 as not prime

    cross_limit.times do |i|
      if sieve[i] 
        # 2 * i + 1 is not yet marked off, thus prime
        ## start marking off all multiples of the prime,
        ## beginning with its square (2 * i * (i + 1))
        ## multiples less than its sqaure have already been
        ## marked off by a lower prime
        (2 * i * (i + 1)...sieve_limit).step(2 * i + 1) do |j|
          sieve[j] = false
        end
      end
    end
    # don't forget to add 2 to our list
    primes = [2]
    sieve.each_with_index do |is_prime, index|
      if is_prime
        primes << 2 * index + 1
      end
    end
    return primes
  end
end
