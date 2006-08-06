<cfset application.wheels = structNew()>
<cfset application.wheels.version = "0.6">
<cfset application.wheels.models = structNew()>

<!--- Used for pluralization and singularization functions --->
<cfset application.wheels.pluralizationRules = arrayNew(2)>
<cfset application.wheels.singularizationRules = arrayNew(2)>
<cfscript>
	// Uncountables
	application.wheels.pluralizationRules[1][1] = "equipment";
	application.wheels.pluralizationRules[1][2] = "equipment";
	application.wheels.pluralizationRules[2][1] = "information";
	application.wheels.pluralizationRules[2][2] = "information";
	application.wheels.pluralizationRules[3][1] = "rice";
	application.wheels.pluralizationRules[3][2] = "rice";
	application.wheels.pluralizationRules[4][1] = "money";
	application.wheels.pluralizationRules[4][2] = "money";
	application.wheels.pluralizationRules[5][1] = "species";
	application.wheels.pluralizationRules[5][2] = "species";
	application.wheels.pluralizationRules[6][1] = "series";
	application.wheels.pluralizationRules[6][2] = "series";
	application.wheels.pluralizationRules[7][1] = "fish";
	application.wheels.pluralizationRules[7][2] = "fish";
	application.wheels.pluralizationRules[8][1] = "sheep";
	application.wheels.pluralizationRules[8][2] = "sheep";
	// Irregulars
	application.wheels.pluralizationRules[9][1] = "person";
	application.wheels.pluralizationRules[9][2] = "people";
	application.wheels.pluralizationRules[10][1] = "man";
	application.wheels.pluralizationRules[10][2] = "men";
	application.wheels.pluralizationRules[11][1] = "child";
	application.wheels.pluralizationRules[11][2] = "children";  		
	application.wheels.pluralizationRules[12][1] = "sex";
	application.wheels.pluralizationRules[12][2] = "sexes";
	application.wheels.pluralizationRules[13][1] = "move";
	application.wheels.pluralizationRules[13][2] = "moves";
	// Everything else
	application.wheels.pluralizationRules[14][1] = "(quiz)$";
	application.wheels.pluralizationRules[14][2] = "\1zes";
	application.wheels.pluralizationRules[15][1] = "^(ox)$";
	application.wheels.pluralizationRules[15][2] = "\1en";
	application.wheels.pluralizationRules[16][1] = "([m|l])ouse$";
	application.wheels.pluralizationRules[16][2] = "\1ice";
	application.wheels.pluralizationRules[17][1] = "(matr|vert|ind)ix|ex$";
	application.wheels.pluralizationRules[17][2] = "\1ices";
	application.wheels.pluralizationRules[18][1] = "(x|ch|ss|sh)$";
	application.wheels.pluralizationRules[18][2] = "\1es";
	application.wheels.pluralizationRules[19][1] = "([^aeiouy]|qu)ies$";
	application.wheels.pluralizationRules[19][2] = "\1y";
	application.wheels.pluralizationRules[20][1] = "([^aeiouy]|qu)y$";
	application.wheels.pluralizationRules[20][2] = "\1ies";
	application.wheels.pluralizationRules[21][1] = "(hive)$";
	application.wheels.pluralizationRules[21][2] = "\1s";
	application.wheels.pluralizationRules[22][1] = "(?:([^f])fe|([lr])f)$";
	application.wheels.pluralizationRules[22][2] = "\1\2ves";
	application.wheels.pluralizationRules[23][1] = "sis$";
	application.wheels.pluralizationRules[23][2] = "ses";
	application.wheels.pluralizationRules[24][1] = "([ti])um$";
	application.wheels.pluralizationRules[24][2] = "\1a";
	application.wheels.pluralizationRules[25][1] = "(buffal|tomat)o$";
	application.wheels.pluralizationRules[25][2] = "\1oes";
	application.wheels.pluralizationRules[26][1] = "(bu)s$";
	application.wheels.pluralizationRules[26][2] = "\1ses";
	application.wheels.pluralizationRules[27][1] = "(alias|status)";
	application.wheels.pluralizationRules[27][2] = "\1es";
	application.wheels.pluralizationRules[28][1] = "(octop|vir)us$";
	application.wheels.pluralizationRules[28][2] = "\1i";
	application.wheels.pluralizationRules[29][1] = "(ax|test)is$";
	application.wheels.pluralizationRules[29][2] = "\1es";
	application.wheels.pluralizationRules[30][1] = "s$";
	application.wheels.pluralizationRules[30][2] = "s";
	application.wheels.pluralizationRules[31][1] = "$";
	application.wheels.pluralizationRules[31][2] = "s";
	
	// Uncountables
	application.wheels.singularizationRules[1][1] = "equipment";
	application.wheels.singularizationRules[1][2] = "equipment";
	application.wheels.singularizationRules[2][1] = "information";
	application.wheels.singularizationRules[2][2] = "information";
	application.wheels.singularizationRules[3][1] = "rice";
	application.wheels.singularizationRules[3][2] = "rice";
	application.wheels.singularizationRules[4][1] = "money";
	application.wheels.singularizationRules[4][2] = "money";
	application.wheels.singularizationRules[5][1] = "species";
	application.wheels.singularizationRules[5][2] = "species";
	application.wheels.singularizationRules[6][1] = "series";
	application.wheels.singularizationRules[6][2] = "series";
	application.wheels.singularizationRules[7][1] = "fish";
	application.wheels.singularizationRules[7][2] = "fish";
	application.wheels.singularizationRules[8][1] = "sheep";
	application.wheels.singularizationRules[8][2] = "sheep";
	
	// Irregulars
	application.wheels.singularizationRules[9][1] = "person";
	application.wheels.singularizationRules[9][2] = "people";
	application.wheels.singularizationRules[10][1] = "man";
	application.wheels.singularizationRules[10][2] = "men";
	application.wheels.singularizationRules[11][1] = "child"; 	
	application.wheels.singularizationRules[11][2] = "children"; 
	application.wheels.singularizationRules[12][1] = "sex";
	application.wheels.singularizationRules[12][2] = "sexes";
	application.wheels.singularizationRules[13][1] = "move";
	application.wheels.singularizationRules[13][2] = "moves";
	
	// Everything else
    application.wheels.singularizationRules[14][1] = "(quiz)zes$";
    application.wheels.singularizationRules[14][2] = "\1";
    application.wheels.singularizationRules[15][1] = "(matr)ices$";
    application.wheels.singularizationRules[15][2] = "\1ix";
    application.wheels.singularizationRules[16][1] = "(vert|ind)ices$";
    application.wheels.singularizationRules[16][2] = "\1ex";
    application.wheels.singularizationRules[17][1] = "^(ox)en";
    application.wheels.singularizationRules[17][2] = "\1";
    application.wheels.singularizationRules[18][1] = "(alias|status)es$";
    application.wheels.singularizationRules[18][2] = "\1";
    application.wheels.singularizationRules[19][1] = "([octop|vir])i$";
    application.wheels.singularizationRules[19][2] = "\1us";
    application.wheels.singularizationRules[20][1] = "(cris|ax|test)es$";
    application.wheels.singularizationRules[20][2] = "\1is";
    application.wheels.singularizationRules[21][1] = "(shoe)s$";
    application.wheels.singularizationRules[21][2] = "\1";
    application.wheels.singularizationRules[22][1] = "(o)es$";
    application.wheels.singularizationRules[22][2] = "\1";
    application.wheels.singularizationRules[23][1] = "(bus)es$";
    application.wheels.singularizationRules[23][2] = "\1";
    application.wheels.singularizationRules[24][1] = "([m|l])ice$";
    application.wheels.singularizationRules[24][2] = "\1ouse";
    application.wheels.singularizationRules[25][1] = "(x|ch|ss|sh)es$";
    application.wheels.singularizationRules[25][2] = "\1";
    application.wheels.singularizationRules[26][1] = "(m)ovies$";
    application.wheels.singularizationRules[26][2] = "\1ovie";
    application.wheels.singularizationRules[27][1] = "(s)eries$";
    application.wheels.singularizationRules[27][2] = "\1eries";
    application.wheels.singularizationRules[28][1] = "([^aeiouy]|qu)ies$";
    application.wheels.singularizationRules[28][2] = "\1y";
    application.wheels.singularizationRules[29][1] = "([lr])ves$";
    application.wheels.singularizationRules[29][2] = "\1f";
    application.wheels.singularizationRules[30][1] = "(tive)s$";
    application.wheels.singularizationRules[30][2] = "\1";
    application.wheels.singularizationRules[31][1] = "(hive)s$";
    application.wheels.singularizationRules[31][2] = "\1";
    application.wheels.singularizationRules[32][1] = "([^f])ves$";
    application.wheels.singularizationRules[32][2] = "\1fe";
    application.wheels.singularizationRules[33][1] = "(^analy)ses$";
    application.wheels.singularizationRules[33][2] = "\1sis";
    application.wheels.singularizationRules[34][1] = "((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$";
    application.wheels.singularizationRules[34][2] = "\1\2sis";
    application.wheels.singularizationRules[35][1] = "([ti])a$";
    application.wheels.singularizationRules[35][2] = "\1um";
    application.wheels.singularizationRules[36][1] = "(n)ews$";
    application.wheels.singularizationRules[36][2] = "\1ews";
    application.wheels.singularizationRules[37][1] = "s$";
    application.wheels.singularizationRules[37][2] = "";
</cfscript>
