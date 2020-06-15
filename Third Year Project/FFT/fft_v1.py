
arr = []
inp = open ("test.txt","r")
#read line into array
for line in inp.readlines():
    # loop over the elemets, split by whitespace
    for i in line.split():
        # convert to integer and append to the list
        arr.append(int(i))

print(arr)
