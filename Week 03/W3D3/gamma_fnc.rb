def gamma_fnc(n, level=1)
    return nil if n == 0
    return 1 if n == 1
    
    if level == 1
        return gamma_fnc(n-1, level+1)
    else
        return n * gamma_fnc(n-1, level+1)
    end
end

  # Test Cases
 p gamma_fnc(0)  # => returns nil
 p gamma_fnc(1)  # => returns 1
 p gamma_fnc(4)  # => returns 6
 p gamma_fnc(8)  # => returns 5040