package cup.multi.tree;

import cup.multi.tree.Interfaces.IMultiTree;
import cup.multi.tree.Interfaces.IMultiTreeNode;

public class MultiTreeMain {
	private static final String[] firstLevelNodes = new String[] {"First Child", "Second Child", "Third Child", "Fourth Child", "Fifth Child"};
	private static final String[] secondLevelNodes = new String[] {"First Child On Second Level", "Second Child On Second Level", "Third Child On Second Level", "Fourth Child On Second Level", "Fifth Child On Second Level"};
	private static final int lastPositionOfFirstLevel = 4;
	public static void main(String[] args) {
		IMultiTree multiTree = new MultiTree();	
		try {
			IMultiTreeNode rootNode = multiTree.createTree("Root Node");
			IMultiTreeNode childOnFirstLevel = null;
			for(int iterator = 0; iterator < 5; iterator++) {
				if(iterator == lastPositionOfFirstLevel) {
					childOnFirstLevel = multiTree.addChildNode(rootNode, firstLevelNodes[iterator]);
					break;
				}
				multiTree.addChildNode(rootNode, firstLevelNodes[iterator]);	
			}
			if(childOnFirstLevel != null) {
				for(int iterator = 0; iterator < 5; iterator++) {
					multiTree.addChildNode(childOnFirstLevel, secondLevelNodes[iterator]);
				}
			}
			multiTree.printTree();
		}
		catch(Exception e) {
			System.out.println("Error occured while creating the tree");
		}
	}
}
