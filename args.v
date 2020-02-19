module main

// a list of type flags for internal processing
enum ArgType {
	bool_t string_t int_t float_t
}

// our main processing structure, to be fully documented
// at a later point.
struct Arguments {
pub:
	arguments []Argumenter
	name string
	version string
	authors []string
	homepage string
}

// a stub for an idea that I'm fleshing out, but probably
// won't follow up on. We'll have to wait and see I guess.
fn (self Arguments) process() { }


// I went ahead and put an interface in here in case we
// decide to impliment specific type structs and not have
// a single meta type. It's called future-proofing yo!
interface Argumenter {
	do_match(arg string) bool
	validate()
}

// the base argument structure, it's a rough draft of what
// was in my head at the moment. Seems sane enough for the
// most part though, so we'll see.
struct BaseArg {
mut:
	result_v string
pub:
	arg_type ArgType
	name string
	aliases []string
	help string
}

fn (self BaseArg) do_match(arg string) bool {
	// this should parse several styles
	// (bare|-short|--long)(=<str>|<int>|<float>) 
	// (NOTE: This isn't supposed to be a valid regex)
	return false
}

fn (self BaseArg) validate() { }

// generator functions for all of our argument types
// there isn't really a need to individually call these
// out here.

fn bool_arg(n string, a []string, h string) &BaseArg {
	return &BaseArg{"", ArgType.bool_t, n, a, h}
}

fn string_arg(n string, a []string, h string) &BaseArg {
	return &BaseArg{"", ArgType.string_t, n, a, h}
}

fn int_arg(n string, a []string, h string) &BaseArg {
	return &BaseArg{"", ArgType.int_t, n, a, h}
}

fn float_arg(n string, a []string, h string) &BaseArg {
	return &BaseArg{"", ArgType.float_t, n, a, h}
}
