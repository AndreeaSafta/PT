package cup.example;

import cup.multi.tree.MultiTree;
import cup.multi.tree.ParserWithTree;
import cup.symbols.table.SymbolsTable;

//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;

import java_cup.runtime.*;

class Driver {

	public static void main(String[] args) throws Exception {
		Parser parser = new ParserWithTree();
		parser.parse();
		
		MultiTree tree = parser.getTree();
		tree.printTree();
		SymbolsTable table = new SymbolsTable(tree);
		table.createTable();
		table.printTable();
    }

}