println("What is your current age?")
age_raw = readline(STDIN)
println("At what age would you like to retire?")
retire_age_raw = readline(STDIN)

age = parse(Int64, age_raw)
retire_age = parse(Int64, retire_age_raw)

duration = retire_age - age
now = Dates.year(Dates.now())
retire_year =  now + duration

println("You have $duration years left until you can retire.")
println("It's $now, so you can retire in $retire_year.")