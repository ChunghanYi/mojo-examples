def process_record(id: Int) raises -> String:
    if id < 0:
        raise Error("invalid record ID: must be non-negative")
    if id > 999:
        raise Error("record not found")
    return String("record_", id)


def main() raises:
    try:
        for id in [5, 0, 1001, -3, 42]:
            var result: String
            try:
                print()
                print("try     => id:", id)
                if id == 0:
                    continue
                result = process_record(id)
            except e:
                if "invalid" in String(e):
                    print("except  => fatal:", e)
                    raise e^
                print("except  => handled:", e)
            else:
                print("else    => success:", result)
            finally:
                print("finally => done with id:", id)
    except e:
        print("\nre-raised error:", e)