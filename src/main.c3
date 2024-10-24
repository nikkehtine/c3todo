module c3todo;
import std::io;
import std::os::env;


fn File! read_user_data() {
	// Should be in ~/.local/share/c3todo

	Path! home = path::new(env::get_var_temp("HOME"))!;
	io::printn(home!);

	File! file = file::open("/home/nikkeh/random/c3todo/src/main.c3", "r")!;

	defer (void)file.close();

	return file;
}

fn int main(String[] args)
{
	File! tasks_file = read_user_data();
	if (catch excuse = tasks_file)
	{
		if (excuse == IoError.FILE_NOT_FOUND)
		{
			io::printn("File not found");
			return 1;
		}
		io::printf("ERROR! %s\n", excuse);
	}
	io::printn(tasks_file!!);

	return 0;
}
