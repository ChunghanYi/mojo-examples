from std.reflection import (
    struct_field_count, struct_field_names,
    get_type_name, struct_field_types
)

def show_type[T: AnyType]():
    comptime type_name = get_type_name[T]()
    comptime field_count = struct_field_count[T]() # count of fields
    comptime field_names = struct_field_names[T]() # indexed list of field names
    comptime field_types = struct_field_types[T]() # indexed list of field types

    print("struct", type_name)

    comptime for idx in range(field_count):
        comptime field_name = field_names[idx]
        comptime field_type = get_type_name[field_types[idx]]()
        var intro = "├──" if idx < (field_count - 1) else "└──"
        print(intro, " var ", field_name, ": ", field_type, sep="")

@fieldwise_init
struct MyStruct:
    var x: String
    var y: Optional[Int]

comptime DefaultItemCount = 10

struct ParameterizedStruct[T: Copyable, item_count: Int = DefaultItemCount](Copyable):
    var list: List[Self.T]
    def __init__(out self):
       self.list = List[Self.T](capacity=Self.item_count)

def main():
    show_type[MyStruct]()
    show_type[Optional[Float64]]()
    show_type[Dict[Int, String]]()
    show_type[ParameterizedStruct[String, item_count=5]]()