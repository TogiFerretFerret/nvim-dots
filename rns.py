with open("pairs.txt","rt") as f:
    lines = f.read().split("\n")
lines = [line.strip() for line in lines]
lines = [line.split(",") for line in lines if line != ""]
nlines=[]
def all_casings(input_string):
    if not input_string:
        yield ""
    else:
        first = input_string[:1]
        if first.lower() == first.upper():
            for sub_casing in all_casings(input_string[1:]):
                yield first + sub_casing
        else:
            for sub_casing in all_casings(input_string[1:]):
                yield first.lower() + sub_casing
                yield first.upper() + sub_casing
for line in lines:
    # Generate every possible upper/lowercase combination of the first element in the line
    # and append it to the line
    for casing in all_casings(line[0]):
        nlines.append([casing, line[1]])
gen_c = [("ca", line[0], line[1]) for line in nlines]
gen_c = [" ".join(line) for line in gen_c]
with open("rns.vim","wt") as f:
    f.write("\n".join(gen_c))
