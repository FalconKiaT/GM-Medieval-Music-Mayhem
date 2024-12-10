// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game(){
	var _file = file_text_open_write("save.dat");
	
	file_text_write_real(_file, global.max_level);
	
	file_text_close(_file);
}

function load_game(){
	if(file_exists("save.dat")){
		var _file = file_text_open_read("save.dat");
		
		global.max_level = file_text_read_real(_file);
		
		file_text_close(_file);
	}
	
}