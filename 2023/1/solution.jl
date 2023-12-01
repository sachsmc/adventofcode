f = open("input")

digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
sum1 = 0
for line in readlines(f)
    digdexfirst = minimum([isnothing(findfirst(d, line)) ? 10000 : findfirst(d, line)[1] for d in digits])
    digdexlast = maximum([isnothing(findlast(d, line)) ? -1 : findlast(d, line)[1] for d in digits])

    sum1 = sum1 + parse(Int64, string(line[digdexfirst], line[digdexlast]))
end

print(sum1)
print("\n")
close(f)

digits2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", 
         "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
numbers = cat(1:9, 1:9; dims = 1)
digits_dict = Dict([(digits2[i], numbers[i]) for i in 1:size(digits2)[1]])

f = open("input")

sum2 = 0
for line in readlines(f)
    digdexfirst = [findfirst(d, line) for d in digits2]
    digdexlast = [findlast(d, line) for d in digits2]

    dig1 = digits_dict[line[digdexfirst[argmin([isnothing(d) ? 10000 : d[1] for d in digdexfirst])]]] 
    dig2 = digits_dict[line[digdexlast[argmax([isnothing(d) ? -1 : d[1] for d in digdexlast])]]]

    sum2 = sum2 + 10 * dig1 + dig2
end

print(sum2)

close(f)
