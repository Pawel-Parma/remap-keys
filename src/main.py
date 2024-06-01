template = 'mapping["%s"] := "%s"'
mapping = {
    "1": "0",  "q": "p",  "a": "l",  "z": "m",
    "2": "9",  "w": "o",  "s": "k",  "x": "n",
    "3": "8",  "e": "i",  "d": "j",  "c": "b",
    "4": "7",  "r": "u",  "f": "h",  "v": "v",
    "5": "6",  "t": "y",  "g": "g",  "b": "c",
    "6": "5",  "y": "t",  "h": "f",  "n": "x",
    "7": "4",  "u": "r",  "j": "d",  "m": "z",
    "8": "3",  "i": "e",  "k": "s",
    "9": "2",  "o": "w",  "l": "a",
    "0": "1",  "p": "q",
}
sort_values = "1234567890qwertyuiopasdfghjklzxcvbnm"

mapped = []
for k, v in mapping.items():
    mapped.append((k, v, template % (k, v)))


mapped.sort(key=lambda x: sort_values.index(x[0]))
print(*mapped, sep="\n")
