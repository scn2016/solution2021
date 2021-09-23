from functools import reduce
from operator import getitem
def get_nested_item(data, keys):
    return reduce(getitem, keys, data)

print(get_nested_item(data={"a":{"b":{"c":"d"}}}, keys=["a","b","c"]))
print(get_nested_item(data={"x":{"y":{"z":"a"}}}, keys=["x","y","z"]))
