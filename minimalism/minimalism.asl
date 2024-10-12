state("Minimalism") {
    uint level: 0x5CB860;
	/**
		Level values:
		1 = Main menu
		2 = Level 1
		3 = Level 2
		...
		31 = Level 30
		32 = Bonus Level
		33 = Credits
	*/
}

startup {
    vars.levels = Enumerable.Range(2, 33).ToArray();

	//Splits
	for (int lvl = 1; lvl <= 30; lvl++) {
		settings.Add("level" + (lvl+1), true, "Level " + lvl);
	}
	settings.Add("level32", true, "Bonus Level");
	settings.Add("level33", true, "Credits");
}

start {
    foreach (int targetLevel in vars.levels) {
		if (current.level == targetLevel && old.level != targetLevel && settings["level" + targetLevel])
			return true;
	}
}

split {
    foreach (int targetLevel in vars.levels) {
		if (current.level == targetLevel && old.level != targetLevel && settings["level" + targetLevel])
			return true;
	}
}

reset {
    return current.level == 1 && old.level != 1; //Main menu
}