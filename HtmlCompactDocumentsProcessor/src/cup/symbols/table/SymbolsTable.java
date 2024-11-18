package cup.symbols.table;

import java.util.HashMap;
import java.util.Map;

import cup.multi.tree.MultiTree;
import cup.multi.tree.MultiTreeNode;

public class SymbolsTable {
	private MultiTree multiTree;
	public HashMap<String, SymbolDetails> table = new HashMap<String, SymbolDetails>();
	
	public SymbolsTable(MultiTree multiTree)
	{
		this.multiTree = multiTree;	
	}
	
	public void createTable()
	{
		extractSymbolsFromNode(multiTree.getTree(), "Global");
	}
	
	public SymbolDetails getSymbol(String symbol)
	{
		if(table.containsKey(symbol))
		{
			return table.get(symbol);
		}
		return null;
	}
	
	public void printTable() 
	{
		for(Map.Entry<String, SymbolDetails> mapEntry : table.entrySet()) {
			String symbol = mapEntry.getKey();
			SymbolDetails details = mapEntry.getValue();
			System.out.println("-------- SYMBOL: " + symbol + " ---------");
			System.out.println("Symbol Type: " + details.symbolType);
			System.out.println("Context: " + details.contextName);
		}
	}
	
	private void extractSymbolsFromNode(MultiTreeNode node, String currentContext) 
	{
		String context = currentContext;
		if (node.getData().contains("Tag"))
		{
			SymbolDetails details = new SymbolDetails();
			details.contextName = currentContext;			
			details.symbolName = node.getData();	
			context = details.symbolName;
			details.symbolType = SymbolType.Tag;
			table.put(details.symbolName, details);
			
		}
		else if (node.getData().contains("attribute"))
		{
			SymbolDetails details = new SymbolDetails();
			details.contextName = currentContext;			
			details.symbolName = node.getData();		
			details.symbolType = SymbolType.Attribute;
			context = details.symbolName;
			table.put(details.symbolName, details);
		}
		else
		{
			SymbolDetails details = new SymbolDetails();
			details.contextName = currentContext;
			details.symbolName = node.getData();
			details.symbolType = SymbolType.Content;
			table.put(details.symbolName, details);
		}
		for (int i = 0; i < node.getChildren().length; i++)
		{
			extractSymbolsFromNode(node.getChildren()[i], context);
		}			
	}
}
