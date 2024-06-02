template = 'mapping["%s"] := "%s"'
mapping = {
    "``": "{Backspace}",
    "F1": "{Enter}",

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
sort_values = [
    "``", "F1",
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
    "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
    "a", "s", "d", "f", "g", "h", "j", "k", "l",
    "z", "x", "c", "v", "b", "n", "m",
]

if mapping.keys() != set(sort_values):
    raise ValueError("Mapping keys do not match sort_values")

mapped = []
for k, v in mapping.items():
    mapped.append((k, v, template % (k, v)))


mapped.sort(key=lambda x: sort_values.index(x[0]))
for i in mapped:
    print(i[2])
