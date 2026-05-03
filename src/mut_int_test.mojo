def append_twice(mut i: Int, j: Int):
   # Mojo knows 's' and 'other' can't be the same string.
   i += j
   i += j

def main():
  var myint1: Int = 100      # Create a run-time String value
  var myint2: Int = 200  # Create a copy of the String value
  append_twice(myint1, myint2)
  print(myint1)