

with open("data/ts/ts_2016.txt", "r") as infile:
	with open("data/ts/ts_2016_fixed.txt", "w") as outfile:
		count = 0

		lines = infile.readlines()
		print(count)
		for line in lines:
			count +=1
			if count == 2674:
				print(line)
				line = line.replace("7940 SOUTH HARLEM AVENUE	", "7940 SOUTH HARLEM AVENUE")
			outfile.write(line)

			