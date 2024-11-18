package cup.multi.tree;

import cup.multi.tree.Interfaces.IMultiTree;
import cup.multi.tree.Interfaces.IMultiTreeNode;

public class MultiTree implements IMultiTree {
	private MultiTreeNode rootNode = null;
	private int nodesCounter = 0;
	
	public MultiTreeNode createTree(String rootData) throws Exception {
		if(rootNode != null) {
			throw new Exception("The tree has already been created");
		}
		
		rootNode = new MultiTreeNode(rootData);
		nodesCounter = 1;
		return rootNode;
	} 
	
	public MultiTreeNode getTree()
	{
		return rootNode;
	}
	
	public MultiTreeNode addChildNode(IMultiTreeNode parentNode, String childData) {
		MultiTreeNode newNode = parentNode.addChildNode(childData);
		nodesCounter = getNodesCounter() + 1;
		return newNode;
	}
	
	public void printTree() {
		if(rootNode == null) {
			System.out.println("The tree was not created yet");
			return;
		}
		rootNode.printNode();
	}
	
	private int getNodesCounter() {
		return nodesCounter;
	}
}
