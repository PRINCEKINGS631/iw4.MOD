// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
main()
{
	self setModel("body_work_civ_male_c");
	codescripts\character::attachHead( "alias_civilian_worker_heads", xmodelalias\alias_civilian_worker_heads::main() );
	self.voice = "american";
}

precache()
{
	precacheModel("body_work_civ_male_c");
	codescripts\character::precacheModelArray(xmodelalias\alias_civilian_worker_heads::main());
}
