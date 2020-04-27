class Type:
    CaskArgs = 1
    Tap = 2
    Brew = 3
    Cask = 4
    Mas = 5

    @staticmethod
    def for_line(line):
        type_to_str_match = {
            Type.CaskArgs: "cask_args ",
            Type.Tap: "tap ",
            Type.Brew: "brew ",
            Type.Cask: "cask ",
            Type.Mas: "mas "
        }

        for type_, match in type_to_str_match.iteritems():
            if line.startswith(match):
                return type_

        print "NONE on %s" % line
        return None


def get_brewfile_contents():
    with open('Brewfile', 'rwb') as f:
        return filter(lambda x: x, map(str.strip, f.readlines()))


def sort_function(a, b):
    a_type = Type.for_line(a)
    b_type = Type.for_line(b)

    if a_type == b_type:
        if a > b:
            return 1
        return -1
    else:
        return a_type - b_type


def main():
    lines = get_brewfile_contents()
    for line in sorted(lines, cmp=sort_function):
        print line


if __name__ == "__main__":
    main()
