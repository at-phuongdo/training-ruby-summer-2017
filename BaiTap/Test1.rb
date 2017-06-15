#Fibonaccy
def Fibonacci(n)
   fib = [1]
   a,b=1,1
   while fib.length <n 
      a,b=b,a+b 
      fib.push(a)
   end
   puts fib      
end
Fibonacci 3



#PrimeNumber
def primeNumber(n)
   temp =0   
   return false if n<=1   
   for i in 2..n/2
      return false if n%i==0
   end
   return true
end

puts primeNumber(6)


#perfectNumber
def perfectNumber(n)
   sum=1
   for i in 2..n/2
      if n%i==0
        sum+=i
     end
  end
  return true if n==sum
  return false
end
puts perfectNumber(6)


#centuryFromYear
def centuryFromYear y
   temp = y%100
   cen = y/100
   return cen if temp ==0
   cen+1

end
puts centuryFromYear(1201)


#seriNumber
def seriNumber(n)
   a =[0]
   return "#{n}<0" if n<0
   return "#{n}=0" if n==0
   for i in 1..n 
      a[i] = a[i-1]+i
   end
   a
end
puts seriNumber(-1)

#Ex2
def squareNumber(n)
   a =[]
   n.each{|i| a.push(i) if (Math.sqrt(i)*10)%10==0}
   a
end
puts squareNumber(1..16)



