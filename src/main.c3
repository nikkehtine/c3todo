module c3todo;
import std::io;

fn int main(String[] args)
{
	File! file = file::open("~/.bashrc", "r");
	defer (void)file.close();
	if (catch excuse = file)
	{
		if (excuse == IoError.FILE_NOT_FOUND)
		{
			io::printn("File not found");
			return 1;
		}
		io::printf("ERROR! %s\n", excuse);
	}

	return 0;
}
