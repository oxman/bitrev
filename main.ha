use fmt;
use io;

export fn main() void = {
	let f = os::open("./abc");
	defer io::close(f);

	for(true) {
		let buf: [os::BUFSIZ]u8 = [0...];
		match (io::read(f, buf)?) {
		case let n: size =>
			io::writeall(os::stderr, buf[..n])?;
		case io::EOF =>
			fmt::println("errrrrrr\n")!;
			break;
		}

	}

};